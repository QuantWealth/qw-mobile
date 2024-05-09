import 'package:flutter/material.dart';
import 'package:quantwealth/app/extensions.dart';
import 'package:quantwealth/core/wallet/wallet_connect_provider.dart';
import 'package:quantwealth/core/wallet/web3auth_provider.dart';
import 'package:quantwealth/ui/auth/auth_page.dart';
import 'package:quantwealth/ui/home/ui/pages/home_page.dart';
import 'package:quantwealth/ui/savings/ui/pages/savings_page.dart';
import 'package:web3modal_flutter/web3modal_flutter.dart';

class TestPage extends StatefulWidget {
  const TestPage({super.key});

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  final wcProvider = WalletConnectProvider();
  final web3Auth = Web3AuthProvider();

  @override
  void initState() {
    super.initState();
    wcProvider.init();
    web3Auth.init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('QuantWealth')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: W3MConnectWalletButton(service: wcProvider.service),
          ),
          Center(
            child: W3MAccountButton(service: wcProvider.service),
          ),
          Center(
            child: ElevatedButton(
              child: Text('WC Personal Sign'),
              onPressed: () {
                wcProvider.personalSign('Hello World');
              },
            ),
          ),
          Center(
            child: ElevatedButton(
              child: Text('Web3Auth Google Login'),
              onPressed: () async => await web3Auth.loginWithGoogle(),
            ),
          ),
          Center(
            child: ElevatedButton(
              child: Text('Go to Auth Page'),
              onPressed: () => context.navigator.push(
                AuthPage().route(),
              ),
            ),
          ),
          Center(
            child: ElevatedButton(
              child: Text('Go to Overview Page'),
              onPressed: () => context.navigator.push(
                HomePage().route(),
              ),
            ),
          ),
          Center(
            child: ElevatedButton(
              child: Text('Go to Savings Page'),
              onPressed: () => context.navigator.push(SavingsPage().route()),
            ),
          )
        ],
      ),
    );
  }
}
