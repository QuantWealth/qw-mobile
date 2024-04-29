import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quantwealth/core/wallet/wallet_connect_provider.dart';
import 'package:web3modal_flutter/web3modal_flutter.dart';

final w3mServiceProvider = Provider<W3MService>((ref) {
  final w3mService = W3MService(
    projectId: '68c90d8869309432fa62984b6a792a16',
    logLevel: LogLevel.debug,
    metadata: const PairingMetadata(
      name: 'QuantWealth',
      description: 'A wealth management app for the future',
      url: 'https://www.quantwealth.xyz/',
      icons: [
        'https://assets-global.website-files.com/662d92f3b61e3145e2bed763/662d9354f6e91759c318062b_logo%20export%20v2-p-500.png'
      ],
      redirect: Redirect(
        native: 'quantwealth://',
        universal: 'https://www.quantwealth.xyz/',
      ),
    ),
  );

  return w3mService;
});

class QuantApp extends ConsumerStatefulWidget {
  const QuantApp({super.key});

  @override
  ConsumerState<QuantApp> createState() => _QuantAppState();
}

class _QuantAppState extends ConsumerState<QuantApp> {
  @override
  void initState() {
    ref.read(w3mServiceProvider).init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      home: Scaffold(
        appBar: AppBar(title: const Text('QuantWealth')),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: W3MConnectWalletButton(
                service: ref.read(w3mServiceProvider),
              ),
            ),
            Center(
              child: W3MAccountButton(
                service: ref.read(w3mServiceProvider),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
