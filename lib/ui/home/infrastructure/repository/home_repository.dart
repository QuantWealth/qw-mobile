import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:quantwealth/ui/home/infrastructure/datasource/user_init_dto.dart';
import 'package:talker/talker.dart';

@lazySingleton
class HomeRepository {
  final Dio _dio;
  final Talker _logger;

  HomeRepository({
    required Dio dio,
    required Talker logger,
  })  : _dio = dio,
        _logger = logger;

  Future<Either<UserInitDto, Exception>> initUser({
    required String walletAddress,
    required String provider,
  }) async {
    try {
      final response = await _dio.post(
        '/user/init',
        data: {
          'signerAddress': walletAddress,
          'provider': provider,
        },
      );

      _logger.info('Response: ${response.data}');
      return Left(UserInitDto.fromJson(response.data['data']));
    } on Exception catch (e) {
      _logger.error('Error: $e');
      return Right(e);
    }
  }
}
