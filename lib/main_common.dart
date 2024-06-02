import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:quantwealth/app/bloc_observer.dart';
import 'package:quantwealth/injectable.dart';

void initCommon() {
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  configureDependencies();
  Bloc.observer = AppBlocObserver();

  FlutterNativeSplash.remove();
}
