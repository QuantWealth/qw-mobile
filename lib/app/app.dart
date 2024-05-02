import 'package:flutter/material.dart';
import 'package:quantwealth/core/wallet/wallet_connect_provider.dart';
import 'package:quantwealth/core/wallet/web3auth_provider.dart';
import 'package:web3modal_flutter/web3modal_flutter.dart';

class QuantApp extends StatefulWidget {
  const QuantApp({super.key});

  @override
  State<QuantApp> createState() => _QuantAppState();
}

class _QuantAppState extends State<QuantApp> {
  final wcCubit = WalletConnectProviderCubit(null);
  final w3Cubit = Web3AuthProviderCubit(null);

  @override
  void initState() {
    super.initState();
    wcCubit.init();
    w3Cubit.init();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      theme: ThemeData(useMaterial3: true),
      home: Scaffold(
        appBar: AppBar(title: const Text('QuantWealth')),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: W3MConnectWalletButton(service: wcCubit.service),
            ),
            Center(
              child: W3MAccountButton(service: wcCubit.service),
            ),
          ],
        ),
      ),
    );
  }
}
