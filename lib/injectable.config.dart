// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i4;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i6;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:logger/logger.dart' as _i5;

import 'di.dart' as _i18;
import 'ui/auth/cubit/auth_cubit.dart' as _i15;
import 'ui/auth/infrastructure/datasources/auth_local_datasource.dart' as _i7;
import 'ui/auth/infrastructure/datasources/auth_remote_datasource.dart' as _i3;
import 'ui/auth/infrastructure/repositories/auth_repository.dart' as _i8;
import 'ui/auth/infrastructure/repository/auth_repository.dart' as _i13;
import 'ui/balance/cubit/balance_cubit.dart' as _i14;
import 'ui/balance/infrastructure/repository/balance_repository.dart' as _i11;
import 'ui/home/infrastructure/repository/home_repository.dart' as _i9;
import 'ui/profile/cubit/profile_cubit.dart' as _i12;
import 'ui/savings/cubit/savings_cubit.dart' as _i16;
import 'ui/savings/cubit/tx_cubit.dart' as _i17;
import 'ui/savings/infrastructure/repository/savings_repository.dart' as _i10;

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
    gh.singleton<_i3.AuthRemoteDatasource>(() => _i3.AuthRemoteDatasource());
    gh.singleton<_i4.Dio>(() => diModule.dio);
    gh.singleton<_i5.Logger>(() => diModule.logger);
    gh.singleton<_i6.FlutterSecureStorage>(() => diModule.storage);
    gh.singleton<_i7.AuthLocalDatasource>(
        () => _i7.AuthLocalDatasource(gh<_i6.FlutterSecureStorage>()));
    gh.singleton<_i8.AuthRepository>(() => _i8.AuthRepository(
          gh<_i3.AuthRemoteDatasource>(),
          gh<_i7.AuthLocalDatasource>(),
        ));
    gh.lazySingleton<_i9.HomeRepository>(() => _i9.HomeRepository(
          dio: gh<_i4.Dio>(),
          logger: gh<_i5.Logger>(),
        ));
    gh.lazySingleton<_i10.SavingsRepository>(() => _i10.SavingsRepository(
          dio: gh<_i4.Dio>(),
          logger: gh<_i5.Logger>(),
        ));
    gh.lazySingleton<_i11.BalanceRepository>(() => _i11.BalanceRepository(
          dio: gh<_i4.Dio>(),
          logger: gh<_i5.Logger>(),
        ));
    gh.lazySingleton<_i12.ProfileCubit>(
        () => _i12.ProfileCubit(homeRepository: gh<_i9.HomeRepository>()));
    gh.lazySingleton<_i13.AuthRepository>(() => _i13.AuthRepository(
        authLocalDatasource: gh<_i7.AuthLocalDatasource>()));
    gh.lazySingleton<_i14.BalanceCubit>(() =>
        _i14.BalanceCubit(balanceRepository: gh<_i11.BalanceRepository>()));
    gh.lazySingleton<_i15.AuthCubit>(() => _i15.AuthCubit(
          authRepository: gh<_i13.AuthRepository>(),
          homeRepository: gh<_i9.HomeRepository>(),
          profileCubit: gh<_i12.ProfileCubit>(),
        ));
    gh.lazySingleton<_i16.SavingsCubit>(() => _i16.SavingsCubit(
          savingsRepository: gh<_i10.SavingsRepository>(),
          profileCubit: gh<_i12.ProfileCubit>(),
        ));
    gh.lazySingleton<_i17.TxCubit>(() => _i17.TxCubit(
          repository: gh<_i10.SavingsRepository>(),
          profileCubit: gh<_i12.ProfileCubit>(),
        ));
    return this;
  }
}

class _$DiModule extends _i18.DiModule {}
