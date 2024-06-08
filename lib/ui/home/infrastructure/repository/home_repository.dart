import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:quantwealth/ui/home/infrastructure/datasource/user_init_dto.dart';

@lazySingleton
class HomeRepository {
  final Dio _dio;
  final Logger _logger;

  HomeRepository({
    required Dio dio,
    required Logger logger,
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

      _logger.i('Response: ${response.data}');
      return Left(UserInitDto.fromJson(response.data['data']));
    } on Exception catch (e) {
      _logger.e('Error: $e');
      return Right(e);
    }
  }

  Future<Either<dynamic, Exception>> createApprove({
    required String walletAddress,
    required int amount,
  }) async {
    try {
      final response = await _dio.get(
        '/orderbook/create-approve',
        data: {
          'assetAddress': walletAddress,
          'amount': amount,
        },
      );

      _logger.i('Response: ${response.data}');
      return Left(null);
    } on Exception catch (e) {
      _logger.e('Error: $e');
      return Right(e);
    }
  }
}
