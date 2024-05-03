import 'package:flutter/material.dart';
import 'package:quantwealth/core/wallet/wallet_connect_provider.dart';
import 'package:quantwealth/core/wallet/web3auth_provider.dart';
import 'package:quantwealth/ui/auth/auth_page.dart';
import 'package:web3modal_flutter/web3modal_flutter.dart';

class QuantApp extends StatelessWidget {
  const QuantApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Web3ModalTheme(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.dark,
        theme: ThemeData(useMaterial3: true),
        home: HomeScreen(),
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
              onPressed: () => wcProvider.personalSign('Hello World'),
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
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => AuthPage()),
              ),
            ),
          )
        ],
      ),
    );
  }
}
