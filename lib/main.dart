import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quantwealth/app/app.dart';
import 'package:quantwealth/app/bloc_observer.dart';
import 'package:quantwealth/injectable.dart';

void main() {
  configureDependencies();
  Bloc.observer = AppBlocObserver();
  runApp(QuantApp());
}
