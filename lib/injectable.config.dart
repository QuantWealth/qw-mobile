// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i3;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i5;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:logger/logger.dart' as _i4;

import 'di.dart' as _i13;
import 'ui/auth/cubit/auth_cubit.dart' as _i12;
import 'ui/auth/infrastructure/datasources/auth_local_datasource.dart' as _i6;
import 'ui/auth/infrastructure/repository/auth_repository.dart' as _i10;
import 'ui/balance/cubit/balance_cubit.dart' as _i11;
import 'ui/balance/infrastructure/repository/balance_repository.dart' as _i7;
import 'ui/savings/cubit/savings_cubit.dart' as _i9;
import 'ui/savings/infrastructure/repository/savings_repository.dart' as _i8;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final diModule = _$DiModule();
    gh.singleton<_i3.Dio>(() => diModule.dio);
    gh.singleton<_i4.Logger>(() => diModule.logger);
    gh.singleton<_i5.FlutterSecureStorage>(() => diModule.storage);
    gh.singleton<_i6.AuthLocalDatasource>(
        () => _i6.AuthLocalDatasource(gh<_i5.FlutterSecureStorage>()));
    gh.lazySingleton<_i7.BalanceRepository>(() => _i7.BalanceRepository(
          dio: gh<_i3.Dio>(),
          logger: gh<_i4.Logger>(),
        ));
    gh.lazySingleton<_i8.SavingsRepository>(() => _i8.SavingsRepository(
          dio: gh<_i3.Dio>(),
          logger: gh<_i4.Logger>(),
        ));
    gh.lazySingleton<_i9.SavingsCubit>(
        () => _i9.SavingsCubit(savingsRepository: gh<_i8.SavingsRepository>()));
    gh.lazySingleton<_i10.AuthRepository>(() => _i10.AuthRepository(
        authLocalDatasource: gh<_i6.AuthLocalDatasource>()));
    gh.lazySingleton<_i11.BalanceCubit>(() =>
        _i11.BalanceCubit(balanceRepository: gh<_i7.BalanceRepository>()));
    gh.lazySingleton<_i12.AuthCubit>(
        () => _i12.AuthCubit(authRepository: gh<_i10.AuthRepository>()));
    return this;
  }
}

class _$DiModule extends _i13.DiModule {}
