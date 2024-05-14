import 'package:flutter/material.dart';
import 'package:quantwealth/injectable.dart';
import 'package:quantwealth/ui/auth/cubit/auth_cubit.dart';
import 'package:quantwealth/ui/auth/views/auth_view.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthView(
      onWalletConnect: () => getIt<AuthCubit>().service.openModal(context),
      onSocialAuth: (type) => getIt<AuthCubit>().onSocialAuth(type),
    );
  }
}
