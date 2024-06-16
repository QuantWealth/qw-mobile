import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:quantwealth/ui/balance/infrastructure/datasource/asset_dto.dart';
import 'package:quantwealth/ui/balance/infrastructure/repository/balance_repository.dart';
import 'package:quantwealth/ui/profile/cubit/profile_cubit.dart';
import 'package:quantwealth/ui/savings/cubit/savings_cubit.dart';

part 'balance_cubit.freezed.dart';
part 'balance_state.dart';

@lazySingleton
class BalanceCubit extends Cubit<BalanceState> {
  final BalanceRepository _repository;
  final ProfileCubit _profileCubit;

  BalanceCubit({
    required BalanceRepository balanceRepository,
    required ProfileCubit profileCubit,
  })  : _repository = balanceRepository,
        _profileCubit = profileCubit,
        super(BalanceState.initial());

  StreamSubscription<ProfileState>? _profileCubitSubscription;

  Future<void> onStart() async {
    _profileCubitSubscription?.cancel();
    _profileCubitSubscription = _profileCubit.stream.listen((state) async {
      if (state.scwAddress.isNotEmpty) {
        emit(BalanceState.loading());
        final result =
            await _repository.getAssets(walletAddress: state.scwAddress);
        result.fold(
          (assets) => emit(BalanceState.loaded(assets)),
          (error) => emit(BalanceState.error(error.toString())),
        );
      }
    });
  }

  @override
  Future<void> close() {
    _profileCubitSubscription?.cancel();
    return super.close();
  }
}
