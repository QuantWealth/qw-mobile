import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quantwealth/app/extensions.dart';
import 'package:quantwealth/injectable.dart';
import 'package:quantwealth/ui/auth/cubit/auth_cubit.dart';
import 'package:quantwealth/ui/auth/pages/auth_page.dart';
import 'package:quantwealth/ui/auth/pages/auth_status_page.dart';
import 'package:quantwealth/ui/home/ui/pages/home_page.dart';
import 'package:quantwealth/ui/savings/cubit/savings_cubit.dart';
import 'package:web3modal_flutter/web3modal_flutter.dart';

class QuantApp extends StatefulWidget {
  const QuantApp({super.key});

  @override
  State<QuantApp> createState() => _QuantAppState();
}

class _QuantAppState extends State<QuantApp> {
  final _navigatorKey = GlobalKey<NavigatorState>();

  @override
  void initState() {
    getIt<AuthCubit>().onStart();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final baseTheme = ThemeData(
      useMaterial3: true,
      fontFamily: 'GalanoGrotesque',
    );

    return MultiBlocListener(
      listeners: [
        BlocListener<AuthCubit, AuthState>(
          bloc: getIt<AuthCubit>(),
          listener: (context, state) {
            switch (state.authStatus) {
              case AuthStatus.connected:
                _navigatorKey.currentContext?.navigator
                    .pushReplacement(HomePage().route());
                break;
              case AuthStatus.disconnected:
                _navigatorKey.currentContext?.navigator
                    .pushReplacement(AuthPage().route());
                break;
              default:
                break;
            }
          },
        ),
        BlocListener<AuthCubit, AuthState>(
          bloc: getIt<AuthCubit>(),
          listenWhen: (previous, current) {
            return previous.authStatus == AuthStatus.connected &&
                current.authStatus == AuthStatus.disconnected;
          },
          listener: (context, state) {
            _navigatorKey.currentContext?.navigator
                .pushReplacement(AuthStatusPage().route());
          },
        ),
      ],
      child: Web3ModalTheme(
        child: MaterialApp(
          navigatorKey: _navigatorKey,
          debugShowCheckedModeBanner: false,
          themeMode: ThemeMode.dark,
          theme: baseTheme,
          home: AuthStatusPage(),
        ),
      ),
    );
  }
}
