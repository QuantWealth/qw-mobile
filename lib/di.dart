import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:injectable/injectable.dart';

@module
abstract class DiModule {
  @singleton
  Dio get dio => Dio(
        BaseOptions(
          baseUrl: 'http://192.168.29.51:3000',
        ),
      );

  @singleton
  Logger get logger => Logger();
}
