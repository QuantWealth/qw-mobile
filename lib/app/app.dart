import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:quantwealth/app/extensions.dart';
import 'package:quantwealth/injectable.dart';
import 'package:quantwealth/ui/auth/cubit/auth_cubit.dart';
import 'package:quantwealth/ui/auth/pages/auth_page.dart';
import 'package:quantwealth/ui/auth/pages/auth_status_page.dart';
import 'package:quantwealth/ui/home/ui/pages/home_page.dart';
import 'package:talker_flutter/talker_flutter.dart';
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
    Future.delayed(const Duration(seconds: 5), () {
      // getIt<FToast>().init(_navigatorKey.currentContext!);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final baseTheme = ThemeData(
      useMaterial3: true,
      fontFamily: 'GalanoGrotesque',
    );

    return Directionality(
      textDirection: TextDirection.ltr,
      child: Material(
        child: Stack(
          children: [
            MultiBlocListener(
              listeners: [
                BlocListener<AuthCubit, AuthState>(
                  bloc: getIt<AuthCubit>(),
                  listenWhen: (previous, current) =>
                      previous.authStatus != current.authStatus,
                  listener: (context, state) {
                    switch (state.authStatus) {
                      case AuthStatus.connected:
                        _navigatorKey.currentContext?.navigator
                            .pushAndRemoveUntil(
                                HomePage().route(), (route) => false);
                        break;
                      case AuthStatus.disconnected:
                        _navigatorKey.currentContext?.navigator
                            .pushAndRemoveUntil(
                                AuthPage().route(), (route) => false);
                        break;
                      default:
                        break;
                    }
                  },
                ),
              ],
              child: Web3ModalTheme(
                child: MaterialApp(
                  navigatorKey: _navigatorKey,
                  navigatorObservers: [TalkerRouteObserver(getIt<Talker>())],
                  debugShowCheckedModeBanner: false,
                  themeMode: ThemeMode.dark,
                  theme: baseTheme,
                  home: AuthStatusPage(),
                  builder: FToastBuilder(),
                ),
              ),
            ),
            Positioned(
              right: .0,
              bottom: 200.0,
              child: IconButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => TalkerScreen(talker: getIt<Talker>()),
                  ));
                },
                icon: Icon(Icons.bug_report_outlined),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
