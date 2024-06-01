import 'package:quantwealth/core/env/alpha_env.dart';
import 'package:quantwealth/core/env/app_env_fields.dart';
import 'package:quantwealth/core/env/dev_env.dart';
import 'package:quantwealth/core/env/prod_env.dart';
import 'package:quantwealth/core/env/staging_env.dart';

abstract interface class AppEnv implements AppEnvFields {
  factory AppEnv() => _instance;

  static AppFlavor _flavor = AppFlavor.DEV;

  static AppFlavor get flavor => _flavor;

  static set setFlavor(AppFlavor value) => _flavor = value;

  static final AppEnv _instance = _flavor == AppFlavor.ALPHA
      ? AlphaEnv()
      : _flavor == AppFlavor.PROD
          ? ProdEnv()
          : flavor == AppFlavor.STAGING
              ? StagingEnv()
              : DevEnv();
}

var appEnv = AppEnv();

enum AppFlavor {
  ALPHA,
  DEV,
  STAGING,
  PROD;

  bool get isAlpha => AppEnv.flavor == AppFlavor.ALPHA;

  bool get isDev => AppEnv.flavor == AppFlavor.DEV;

  bool get isStaging => AppEnv.flavor == AppFlavor.STAGING;

  bool get isProd => AppEnv.flavor == AppFlavor.PROD;
}
