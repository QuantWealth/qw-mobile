import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quantwealth/injectable.dart';
import 'package:quantwealth/ui/auth/cubit/auth_cubit.dart';
import 'package:quantwealth/ui/auth/views/auth_view.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      bloc: getIt<AuthCubit>(),
      listenWhen: (previous, current) =>
          previous.authStatus == AuthStatus.disconnected &&
          current.loginType == LoginType.walletConnect,
      listener: (_, state) {
        if (state.loginType == LoginType.walletConnect) {
          getIt<AuthCubit>().service.openModal(context);
        }
      },
      builder: (_, state) {
        return AuthView(
          onWalletConnect: () => getIt<AuthCubit>().onWalletConnect(),
          onSocialAuth: (type) => getIt<AuthCubit>().onSocialAuth(type),
        );
      },
    );
  }
}
