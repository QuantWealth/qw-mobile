import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:logger/logger.dart';
import 'package:injectable/injectable.dart';

@module
abstract class DiModule {
  @singleton
  Dio get dio => Dio(
        BaseOptions(
          baseUrl: 'http://172.26.185.87:3000',
        ),
      );

  @singleton
  Logger get logger => Logger();

  @singleton
  FlutterSecureStorage get storage => FlutterSecureStorage();
}
