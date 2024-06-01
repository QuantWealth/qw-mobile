import 'package:flutter/material.dart';
import 'package:quantwealth/app/app.dart';
import 'package:quantwealth/core/env/app_env.dart';
import 'package:quantwealth/main_common.dart';

void main() {
  AppEnv.setFlavor = AppFlavor.PROD;

  initCommon();
  runApp(QuantApp());
}
