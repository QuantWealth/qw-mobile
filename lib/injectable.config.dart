// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i4;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i7;
import 'package:fluttertoast/fluttertoast.dart' as _i6;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:talker/talker.dart' as _i9;
import 'package:talker_flutter/talker_flutter.dart' as _i5;

import 'di.dart' as _i20;
import 'ui/auth/cubit/auth_cubit.dart' as _i16;
import 'ui/auth/infrastructure/datasources/auth_local_datasource.dart' as _i12;
import 'ui/auth/infrastructure/datasources/auth_remote_datasource.dart' as _i3;
import 'ui/auth/infrastructure/repositories/auth_repository.dart' as _i13;
import 'ui/auth/infrastructure/repository/auth_repository.dart' as _i15;
import 'ui/balance/cubit/balance_cubit.dart' as _i19;
import 'ui/balance/infrastructure/repository/balance_repository.dart' as _i11;
import 'ui/home/infrastructure/repository/home_repository.dart' as _i8;
import 'ui/profile/cubit/profile_cubit.dart' as _i14;
import 'ui/savings/cubit/savings_cubit.dart' as _i17;
import 'ui/savings/cubit/tx_cubit.dart' as _i18;
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
    gh.singleton<_i5.Talker>(() => diModule.logger);
    gh.singleton<_i6.FToast>(() => diModule.toast);
    gh.singleton<_i7.FlutterSecureStorage>(() => diModule.storage);
    gh.lazySingleton<_i8.HomeRepository>(() => _i8.HomeRepository(
          dio: gh<_i4.Dio>(),
          logger: gh<_i9.Talker>(),
        ));
    gh.lazySingleton<_i10.SavingsRepository>(() => _i10.SavingsRepository(
          dio: gh<_i4.Dio>(),
          logger: gh<_i9.Talker>(),
        ));
    gh.lazySingleton<_i11.BalanceRepository>(() => _i11.BalanceRepository(
          dio: gh<_i4.Dio>(),
          logger: gh<_i9.Talker>(),
        ));
    gh.singleton<_i12.AuthLocalDatasource>(
        () => _i12.AuthLocalDatasource(gh<_i7.FlutterSecureStorage>()));
    gh.singleton<_i13.AuthRepository>(() => _i13.AuthRepository(
          gh<_i3.AuthRemoteDatasource>(),
          gh<_i12.AuthLocalDatasource>(),
        ));
    gh.lazySingleton<_i14.ProfileCubit>(
        () => _i14.ProfileCubit(homeRepository: gh<_i8.HomeRepository>()));
    gh.lazySingleton<_i15.AuthRepository>(() => _i15.AuthRepository(
        authLocalDatasource: gh<_i12.AuthLocalDatasource>()));
    gh.lazySingleton<_i16.AuthCubit>(() => _i16.AuthCubit(
          authRepository: gh<_i15.AuthRepository>(),
          homeRepository: gh<_i8.HomeRepository>(),
          profileCubit: gh<_i14.ProfileCubit>(),
        ));
    gh.lazySingleton<_i17.SavingsCubit>(() => _i17.SavingsCubit(
          savingsRepository: gh<_i10.SavingsRepository>(),
          profileCubit: gh<_i14.ProfileCubit>(),
        ));
    gh.lazySingleton<_i18.TxCubit>(() => _i18.TxCubit(
          repository: gh<_i10.SavingsRepository>(),
          profileCubit: gh<_i14.ProfileCubit>(),
        ));
    gh.lazySingleton<_i19.BalanceCubit>(() => _i19.BalanceCubit(
          balanceRepository: gh<_i11.BalanceRepository>(),
          profileCubit: gh<_i14.ProfileCubit>(),
        ));
    return this;
  }
}

class _$DiModule extends _i20.DiModule {}
