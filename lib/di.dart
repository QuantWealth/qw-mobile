import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:logger/logger.dart';
import 'package:injectable/injectable.dart';

@module
abstract class DiModule {
  @singleton
  Dio get dio => Dio(
        BaseOptions(
          baseUrl: 'https://ffcf-101-0-63-102.ngrok-free.app',
        ),
      );

  @singleton
  Logger get logger => Logger();

  @singleton
  FlutterSecureStorage get storage => FlutterSecureStorage();
}
