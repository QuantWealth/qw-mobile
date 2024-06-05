import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:quantwealth/ui/savings/infrastructure/datasource/savings_dto.dart';

@lazySingleton
class SavingsRepository {
  final Dio _dio;
  final Logger _logger;

  SavingsRepository({
    required Dio dio,
    required Logger logger,
  })  : _dio = dio,
        _logger = logger;

  Future<Either<List<SavingsDto>, Exception>> getSavingOptions({
    required String address,
  }) async {
    try {
      final response = await _dio.get(
        '/saving/all',
        data: {'scwAddress': address},
      );
      final data = response.data as Map<String, dynamic>;

      final savings = (data['data'] as List<dynamic>)
          .map((e) => SavingsDto.fromJson(e as Map<String, Object?>))
          .toList();

      _logger.d(savings);
      return left(savings);
    } catch (e) {
      _logger.e(e);
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

      _logger.d(response);
      return none();
    } catch (e) {
      _logger.e(e);
      return some(Exception(e.toString()));
    }
  }
}
