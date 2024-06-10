part of 'tx_cubit.dart';

@freezed
class TxState with _$TxState {
  const factory TxState({
    required TxStatus status,
    ApprovedTxDto? tx,
    int? amount,
    String? error,
  }) = _Initial;

  factory TxState.initial() => TxState(
        status: TxStatus.none,
      );

  factory TxState.loading({
    required int amount,
    required ApprovedTxDto tx,
  }) =>
      TxState(
        amount: amount,
        tx: tx,
        status: TxStatus.pending,
      );

  factory TxState.approved() => TxState(
        status: TxStatus.approved,
      );

  factory TxState.success(int amount) => TxState(
        amount: amount,
        status: TxStatus.success,
      );

  factory TxState.failure(String error) => TxState(
        status: TxStatus.failed,
        error: error,
      );
}

enum TxStatus {
  none,
  pending,
  approved,
  rejected,
  failed,
  success,
}
