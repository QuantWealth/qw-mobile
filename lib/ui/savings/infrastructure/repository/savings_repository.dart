import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:quantwealth/ui/savings/infrastructure/datasource/approved_tx_dto.dart';
import 'package:quantwealth/ui/savings/infrastructure/datasource/savings_dto.dart';
import 'package:talker/talker.dart';

@lazySingleton
class SavingsRepository {
  final Dio _dio;
  final Talker _logger;

  SavingsRepository({
    required Dio dio,
    required Talker logger,
  })  : _dio = dio,
        _logger = logger;

  Future<Either<List<SavingsDto>, Exception>> getSavingOptions({
    required String address,
  }) async {
    try {
      final response = await _dio.get(
        '/saving/all',
        queryParameters: {'scwAddress': address},
      );
      final data = response.data as Map<String, dynamic>;

      final savings = (data['data'] as List<dynamic>)
          .map((e) => SavingsDto.fromJson(e as Map<String, Object?>))
          .toList();

      _logger.info(savings);
      return left(savings);
    } catch (e) {
      _logger.error(e);
      return right(Exception(e.toString()));
    }
  }

  Future<Option<Exception>> invest({
    required String type,
    required int amount,
  }) async {
    try {
      final response = await _dio.post(
        '/saving/create/transaction',
        data: {
          'savingType': type,
          'amount': amount,
        },
      );

      _logger.info(response);
      return none();
    } catch (e) {
      _logger.error(e);
      return some(Exception(e.toString()));
    }
  }

  Future<Either<ApprovedTxDto, Exception>> createApprove({
    String assetAddress = '0x83A9aE82b26249EC6e01498F5aDf0Ec20fF3Da9C',
    required String walletAddress,
    required int amount,
  }) async {
    try {
      final response = await _dio.get(
        '/orderbook/create-approve',
        queryParameters: {
          'assetAddress': assetAddress,
          'walletAddress': walletAddress,
          'amount': amount,
        },
      );

      _logger.info('Response: ${response.data}');
      return Left(ApprovedTxDto.fromJson(response.data['data']));
    } on Exception catch (e) {
      _logger.error('Error: $e');
      return Right(e);
    }
  }

  Future<Either<String, Exception>> sendApprove({
    required String signerAddress,
    required String walletAddress,
    required MetaTxData metaTransaction,
    required String signature,
    required String strategy,
    required int amount,
  }) async {
    try {
      final response = await _dio.post(
        '/orderbook/send-approve',
        data: {
          'signerAddress': signerAddress,
          'walletAddress': walletAddress,
          'metaTransaction': metaTransaction.toJson(),
          'signature': signature,
          'strategyType': strategy,
          'amount': amount,
        },
      );

      _logger.info('Response: ${response.data}');
      return left(response.data['data']['taskId']);
    } on Exception catch (e) {
      _logger.error('Error: $e');
      return right(e);
    }
  }
}
