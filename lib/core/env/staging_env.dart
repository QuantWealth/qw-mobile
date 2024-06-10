import 'package:envied/envied.dart';
import 'package:logger/logger.dart';
import 'package:quantwealth/core/env/app_env.dart';
import 'package:quantwealth/core/env/app_env_fields.dart';

part 'staging_env.g.dart';

@Envied(name: 'Env', path: '.env.staging')
final class StagingEnv implements AppEnv, AppEnvFields {
  StagingEnv();

  @override
  @EnviedField(varName: 'API_URL', obfuscate: true)
  final String apiUrl = _Env.apiUrl;

  @override
  final Level logLevel = Level.all;

  @override
  @EnviedField(varName: 'WC_PROJECT_ID', obfuscate: true)
  final String wcProjectId = _Env.wcProjectId;

  @override
  @EnviedField(varName: 'W3_CLIENT_ID', obfuscate: true)
  final String w3ClientId = _Env.w3ClientId;
}
