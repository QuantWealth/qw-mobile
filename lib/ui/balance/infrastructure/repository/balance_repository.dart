import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:quantwealth/ui/balance/infrastructure/datasource/asset_dto.dart';
import 'package:talker/talker.dart';

@lazySingleton
class BalanceRepository {
  final Dio _dio;
  final Talker _logger;

  BalanceRepository({
    required Dio dio,
    required Talker logger,
  })  : _dio = dio,
        _logger = logger;

  Future<Either<List<AssetDto>, Exception>> getAssets({
    required String walletAddress,
    int next = 10,
    int limit = 10,
    String sort = 'asc',
  }) async {
    try {
      final response = await _dio.get(
        '/user/balance',
        queryParameters: {
          'walletAddress': walletAddress,
          'next': next,
          'limit': limit,
          'sort': sort,
        },
      );
      final data = response.data as Map<String, dynamic>;

      _logger.info('Response: ${data['data']['items']}');

      final assets = (data['data']['items'] as List<dynamic>)
          .map((e) => AssetDto.fromJson(e as Map<String, Object?>))
          .toList();

      _logger.info(assets);
      return left(assets);
    } catch (e, t) {
      _logger.error(e, t);
      return right(Exception(e.toString()));
    }
  }
}
