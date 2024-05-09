part of 'savings_cubit.dart';

@freezed
class SavingsState with _$SavingsState {
  const factory SavingsState({
    required String amount,
    required AmountInputLevels? selectedInputLevel,
    required RequestStatus status,
  }) = _Initial;

  factory SavingsState.initial() => SavingsState(
        amount: '',
        selectedInputLevel: AmountInputLevels.l0,
        status: RequestStatus.initial,
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
