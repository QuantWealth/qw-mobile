import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:quantwealth/ui/auth/cubit/auth_cubit.dart';
import 'package:quantwealth/ui/profile/cubit/profile_cubit.dart';
import 'package:quantwealth/ui/savings/infrastructure/datasource/savings_dto.dart';
import 'package:quantwealth/ui/savings/infrastructure/repository/savings_repository.dart';

part 'savings_state.dart';
part 'savings_cubit.freezed.dart';

@lazySingleton
class SavingsCubit extends Cubit<SavingsState> {
  final SavingsRepository _repository;
  final ProfileCubit _profileCubit;

  SavingsCubit({
    required SavingsRepository savingsRepository,
    required ProfileCubit profileCubit,
  })  : _repository = savingsRepository,
        _profileCubit = profileCubit,
        super(SavingsState.initial());

  Future<void> onStart() async {
    emit(SavingsState.loading());
    final result = await _repository.getSavingOptions(
      address: '0x665d8a50912FC42A88233e9eA53e70980dcb9Ecd',
    );
    result.fold(
      (savings) => emit(SavingsState.success(
        amount: state.amount,
        investmentStatus: RequestStatus.initial,
        savingOptions: savings,
      )),
      (error) => emit(SavingsState.failure(
        error.toString(),
        investmentStatus: RequestStatus.initial,
      )),
    );
  }

  Future<void> sendApprove() async {
    final profile = _profileCubit.state;
    final approvedTx = await _repository.createApprove(
      walletAddress: profile.scwAddress,
      amount: 2000000,
    );

    approvedTx.fold(
      (tx) {
        debugPrint(tx.toString());
      },
      (error) => emit(SavingsState.failure(error.toString())),
    );
  }

  Future<void> invest() async {
    if (state.selectedSavingsOption == null) {
      emit(SavingsState.failure('Invalid savings option'));
      return;
    }

    emit(state.copyWith(status: RequestStatus.loading));
    final result = await _repository.invest(
      type: state.selectedSavingsOption!.type,
      amount: int.tryParse(state.amount) ?? 0,
    );

    result.fold(
      () => emit(SavingsState.success(
        amount: state.amount,
        investmentStatus: RequestStatus.success,
        savingOptions: state.savingOptions,
      )),
      (e) => emit(SavingsState.failure(e.toString())),
    );
  }

  void amountChanged(String amount) {
    emit(state.copyWith(amount: amount));
  }

  void switchOption(SavingsDto option) {
    emit(state.copyWith(selectedSavingsOption: option));
  }
}
