import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quantwealth/app/extensions.dart';
import 'package:quantwealth/injectable.dart';
import 'package:quantwealth/ui/auth/cubit/auth_cubit.dart';
import 'package:quantwealth/ui/auth/views/auth_view.dart';
import 'package:quantwealth/ui/home/ui/pages/home_page.dart';
import 'package:quantwealth/ui/savings/cubit/savings_cubit.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      bloc: getIt<AuthCubit>()..onStart(),
      listener: (_, state) {
        if (state.authStatus == RequestStatus.success) {
          context.navigator.push(HomePage().route());
        }
      },
      builder: (_, state) {
        return AuthView(
          onSocialAuth: (type) => getIt<AuthCubit>().onSocialAuth(type),
        );
      },
    );
  }
}
