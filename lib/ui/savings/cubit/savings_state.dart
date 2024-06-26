part of 'savings_cubit.dart';

@freezed
class SavingsState with _$SavingsState {
  const factory SavingsState({
    required String amount,
    required List<SavingsDto> savingOptions,
    SavingsDto? selectedSavingsOption,
    AmountInputLevels? selectedInputLevel,
    required RequestStatus investmentStatus,
    required RequestStatus status,
    String? error,
  }) = _Initial;

  factory SavingsState.initial() => SavingsState(
        amount: '',
        savingOptions: [],
        selectedInputLevel: AmountInputLevels.l0,
        investmentStatus: RequestStatus.initial,
        status: RequestStatus.initial,
      );

  factory SavingsState.loading() => SavingsState(
        amount: '',
        savingOptions: [],
        selectedInputLevel: AmountInputLevels.l0,
        investmentStatus: RequestStatus.loading,
        status: RequestStatus.loading,
      );

  factory SavingsState.success({
    required String amount,
    required RequestStatus investmentStatus,
    required List<SavingsDto> savingOptions,
  }) =>
      SavingsState(
        amount: amount,
        savingOptions: savingOptions,
        selectedSavingsOption: savingOptions.firstOrNull,
        investmentStatus: investmentStatus,
        status: RequestStatus.success,
      );

  factory SavingsState.failure(
    String error, {
    RequestStatus investmentStatus = RequestStatus.failure,
  }) =>
      SavingsState(
        amount: '',
        savingOptions: [],
        selectedInputLevel: AmountInputLevels.l0,
        status: RequestStatus.failure,
        investmentStatus: investmentStatus,
        error: error,
      );
}

enum RequestStatus {
  initial,
  loading,
  success,
  failure;

  bool get isLoading =>
      this == RequestStatus.initial || this == RequestStatus.loading;

  bool get isSuccess => this == RequestStatus.success;

  bool get isFailure => this == RequestStatus.failure;
}

enum AmountInputLevels {
  l0,
  l25,
  l50,
  l75,
  l100;

  int get value {
    switch (this) {
      case AmountInputLevels.l0:
        return 0;
      case AmountInputLevels.l25:
        return 25;
      case AmountInputLevels.l50:
        return 50;
      case AmountInputLevels.l75:
        return 75;
      case AmountInputLevels.l100:
        return 100;
    }
  }

  static List<AmountInputLevels> get uiValues => [
        AmountInputLevels.l25,
        AmountInputLevels.l50,
        AmountInputLevels.l75,
        AmountInputLevels.l100,
      ];
}
