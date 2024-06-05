import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:quantwealth/ui/savings/infrastructure/datasource/savings_dto.dart';
import 'package:quantwealth/ui/savings/infrastructure/repository/savings_repository.dart';

part 'savings_state.dart';
part 'savings_cubit.freezed.dart';

@lazySingleton
class SavingsCubit extends Cubit<SavingsState> {
  final SavingsRepository _repository;

  SavingsCubit({
    required SavingsRepository savingsRepository,
  })  : _repository = savingsRepository,
        super(SavingsState.initial());

  Future<void> onStart() async {
    emit(SavingsState.loading());
    final result = await _repository.getSavingOptions(address: '');
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
