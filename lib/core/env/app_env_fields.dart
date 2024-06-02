import 'package:logger/logger.dart';

abstract interface class AppEnvFields {
  /// [apiUrl] represents RingRing API Base Url
  abstract final String apiUrl;

  /// [logLevel] represents the log level for generic logging of the entire app
  abstract final Level logLevel;

  abstract final String wcProjectId;

  abstract final String w3ClientId;
}
