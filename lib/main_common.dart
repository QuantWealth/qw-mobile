import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quantwealth/app/bloc_observer.dart';
import 'package:quantwealth/injectable.dart';

void initCommon() {
  configureDependencies();
  Bloc.observer = AppBlocObserver();
}
