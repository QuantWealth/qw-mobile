import 'package:quantwealth/ui/auth/cubit/auth_cubit.dart';

class ProfileState {
  final LoginType loginType;
  final String walletAddress;
  final String scwAddress;

  ProfileState({
    required this.loginType,
    required this.walletAddress,
    required this.scwAddress,
  });

  factory ProfileState.initial() => ProfileState(
    loginType: LoginType.none,
    walletAddress: '',
    scwAddress: '',
  );

  ProfileState copyWith({
    LoginType? loginType,
    String? walletAddress,
    String? scwAddress,
  }) {
    return ProfileState(
      loginType: loginType ?? this.loginType,
      walletAddress: walletAddress ?? this.walletAddress,
      scwAddress: scwAddress ?? this.scwAddress,
    );
  }
}
