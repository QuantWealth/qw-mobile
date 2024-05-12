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
    final result = await _repository.getSavingOptions();
    result.fold(
      (savings) => emit(SavingsState.success(
        amount: state.amount,
        savingOptions: savings,
        selectedInputLevel: AmountInputLevels.l0,
      )),
      (error) => emit(SavingsState.failure(error.toString())),
    );
  }

  void switchOption(SavingsDto option) {
    emit(state.copyWith(selectedSavingsOption: option));
  }
}
