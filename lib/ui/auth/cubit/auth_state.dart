part of 'auth_cubit.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState({
    LoginType? loginType,
    required RequestStatus authStatus,
    String? error,
  }) = _Initial;

  factory AuthState.initial() => AuthState(
        authStatus: RequestStatus.initial,
        error: null,
      );

  factory AuthState.loading() => AuthState(
        authStatus: RequestStatus.loading,
        error: null,
      );

  factory AuthState.error(String error) => AuthState(
        authStatus: RequestStatus.failure,
        error: error,
      );

  factory AuthState.success() => AuthState(
        authStatus: RequestStatus.success,
        error: null,
      );
}

enum LoginType { walletConnect }
