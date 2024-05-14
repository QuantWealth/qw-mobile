import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:quantwealth/ui/balance/infrastructure/datasource/asset_dto.dart';

@lazySingleton
class BalanceRepository {
  final Dio _dio;
  final Logger _logger;

  BalanceRepository({
    required Dio dio,
    required Logger logger,
  })  : _dio = dio,
        _logger = logger;

  Future<Either<List<AssetDto>, Exception>> getAssets({
    required String walletAddress,
    int next = 10,
    int limit = 10,
    String sort = 'ascending',
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

      final assets = (data['data'] as List<dynamic>)
          .map((e) => AssetDto.fromJson(e as Map<String, Object?>))
          .toList();

      _logger.d(assets);
      return left(assets);
    } catch (e) {
      _logger.e(e);
      return right(Exception(e.toString()));
    }
  }
}
