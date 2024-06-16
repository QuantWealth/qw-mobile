import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:injectable/injectable.dart';
import 'package:quantwealth/core/env/app_env.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';
import 'package:talker_flutter/talker_flutter.dart';

@module
abstract class DiModule {
  @singleton
  Dio get dio => Dio(BaseOptions(baseUrl: appEnv.apiUrl))
    ..interceptors.add(
      TalkerDioLogger(
        settings: const TalkerDioLoggerSettings(
          printRequestHeaders: true,
          printResponseHeaders: true,
          printResponseMessage: true,
        ),
      ),
    );

  @singleton
  Talker get logger => TalkerFlutter.init();

  @singleton
  FToast get toast => FToast();

  @singleton
  FlutterSecureStorage get storage => FlutterSecureStorage();
}
