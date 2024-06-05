import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:logger/logger.dart';
import 'package:injectable/injectable.dart';

@module
abstract class DiModule {
  @singleton
  Dio get dio => Dio(
        BaseOptions(
          baseUrl: 'http://192.168.29.25:3000',
        ),
      );

  @singleton
  Logger get logger => Logger();

  @singleton
  FlutterSecureStorage get storage => FlutterSecureStorage();
}
