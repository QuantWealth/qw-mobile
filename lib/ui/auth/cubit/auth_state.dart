part of 'auth_cubit.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState({
    required LoginType loginType,
    required AuthStatus authStatus,
    String? error,
  }) = _Initial;

  factory AuthState.initial() => AuthState(
        authStatus: AuthStatus.initial,
        loginType: LoginType.none,
        error: null,
      );

  factory AuthState.loading() => AuthState(
        authStatus: AuthStatus.loading,
        loginType: LoginType.none,
        error: null,
      );

  factory AuthState.error(String error) => AuthState(
        authStatus: AuthStatus.error,
        loginType: LoginType.none,
        error: error,
      );

  factory AuthState.success() => AuthState(
        authStatus: AuthStatus.connected,
        loginType: LoginType.none,
        error: null,
      );

  factory AuthState.disconnected() => AuthState(
        authStatus: AuthStatus.disconnected,
        loginType: LoginType.none,
        error: null,
      );
}

enum LoginType { none, walletConnect, web3Auth }

enum AuthStatus {
  initial,
  loading,
  connected,
  disconnected,
  error,
}
