part of 'auth_cubit.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState({
    required LoginType loginType,
    required RequestStatus authStatus,
    String? error,
  }) = _Initial;

  factory AuthState.initial() => AuthState(
        authStatus: RequestStatus.initial,
        loginType: LoginType.none,
        error: null,
      );

  factory AuthState.loading() => AuthState(
        authStatus: RequestStatus.loading,
        loginType: LoginType.none,
        error: null,
      );

  factory AuthState.error(String error) => AuthState(
        authStatus: RequestStatus.failure,
        loginType: LoginType.none,
        error: error,
      );

  factory AuthState.success() => AuthState(
        authStatus: RequestStatus.success,
        loginType: LoginType.none,
        error: null,
      );
}

enum LoginType { none, walletConnect, web3Auth }
