part of 'balance_cubit.dart';

@freezed
class BalanceState with _$BalanceState {
  const factory BalanceState({
    required List<AssetDto> assets,
    required RequestStatus status,
    required String? error,
  }) = _Initial;

  factory BalanceState.initial() => BalanceState(
        assets: [],
        status: RequestStatus.initial,
        error: null,
      );

  factory BalanceState.loading() => BalanceState(
        assets: [],
        status: RequestStatus.loading,
        error: null,
      );

  factory BalanceState.loaded(List<AssetDto> assets) => BalanceState(
        assets: assets,
        status: RequestStatus.success,
        error: null,
      );

  factory BalanceState.error(String error) => BalanceState(
        assets: [],
        status: RequestStatus.failure,
        error: error,
      );
}
