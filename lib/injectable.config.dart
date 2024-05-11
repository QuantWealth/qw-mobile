// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:logger/logger.dart' as _i4;

import 'di.dart' as _i7;
import 'ui/savings/cubit/savings_cubit.dart' as _i6;
import 'ui/savings/infrastructure/repository/savings_repository.dart' as _i5;

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
    gh.lazySingleton<_i5.SavingsRepository>(() => _i5.SavingsRepository(
          dio: gh<_i3.Dio>(),
          logger: gh<_i4.Logger>(),
        ));
    gh.lazySingleton<_i6.SavingsCubit>(
        () => _i6.SavingsCubit(savingsRepository: gh<_i5.SavingsRepository>()));
    return this;
  }
}

class _$DiModule extends _i7.DiModule {}
