import 'package:flutter/material.dart';
import 'package:quantwealth/app/icons.dart';
import 'package:quantwealth/core/wallet/wallet_connect_provider.dart';
import 'package:quantwealth/core/wallet/web3auth_provider.dart';
import 'package:quantwealth/ui/common/icon_outlined_button.dart';
import 'package:quantwealth/ui/common/icon_outlined_text_button.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final web3AuthProvider = Web3AuthProvider();
  final wcAuthProvider = WalletConnectProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Let\'s setup your account',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconOutlinedTextButton(
                  title: 'MetaMask',
                  assetIcon: SvgIcons.metamask,
                  onPressed: () {},
                ),
                IconOutlinedTextButton(
                  title: 'Coinbase',
                  assetIcon: SvgIcons.coinbase,
                  onPressed: () {},
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconOutlinedTextButton(
                  title: 'WalletConnect',
                  assetIcon: SvgIcons.walletConnect,
                  onPressed: () {},
                ),
              ],
            ),
            SizedBox(height: 80),
            Text(
              'or continue with socials',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconOutlinedButton(
                  icon: Icons.facebook,
                  onPressed: () async =>
                      await web3AuthProvider.loginWithGoogle(),
                ),
                SizedBox(width: 9),
                IconOutlinedButton(
                  icon: Icons.apple,
                  onPressed: () async =>
                      await web3AuthProvider.loginWithApple(),
                ),
                SizedBox(width: 9),
                IconOutlinedButton(
                  icon: Icons.key,
                  onPressed: () async {},
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
