import 'package:envied/envied.dart';
import 'package:logger/logger.dart';
import 'package:quantwealth/core/env/app_env.dart';
import 'package:quantwealth/core/env/app_env_fields.dart';

part 'prod_env.g.dart';

@Envied(name: 'Env', path: '.env.prod')
final class ProdEnv implements AppEnv, AppEnvFields {
  ProdEnv();

  @override
  @EnviedField(varName: 'API_URL', obfuscate: true)
  final String apiUrl = _Env.apiUrl;

  @override
  final Level logLevel = Level.off;
}
