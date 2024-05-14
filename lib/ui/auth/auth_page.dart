import 'package:flutter/material.dart';
import 'package:quantwealth/app/extensions.dart';
import 'package:quantwealth/app/theme/icons.dart';
import 'package:quantwealth/core/wallet/wallet_connect_provider.dart';
import 'package:quantwealth/core/wallet/web3auth_provider.dart';
import 'package:quantwealth/ui/common/icon_outlined_button.dart';
import 'package:quantwealth/ui/common/icon_outlined_text_button.dart';
import 'package:quantwealth/ui/savings/ui/pages/savings_page.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final web3AuthProvider = Web3AuthProvider();
  final wcAuthProvider = WalletConnectProvider();

  late final TextEditingController emailController;

  @override
  void initState() {
    emailController = TextEditingController();
    wcAuthProvider.init();
    web3AuthProvider.init();
    super.initState();
  }
  // column payment task will mammal attract mouse direct can modify loud expand

  @override
  void dispose() {
    wcAuthProvider.cleanupListeners();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
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
                  onPressed: () async =>
                      await wcAuthProvider.service.openModal(context),
                ),
              ],
            ),
            SizedBox(height: 80),
            Text(
              'or continue with socials',
              style: TextStyle(fontSize: 24),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: 20,
                horizontal: 30,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                        hintText: 'Enter your email...',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: Color(0xFFE2E8F0)),
                        ),
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.normal,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                  SizedBox(
                    height: 68,
                    width: 54,
                    child: ElevatedButton(
                      onPressed: () => context.navigator.push(
                        SavingsPage().route(),
                      ),
                      style: ElevatedButton.styleFrom(
                        elevation: .0,
                        padding: EdgeInsets.zero,
                        foregroundColor: Colors.black,
                        backgroundColor: Color(0xFFF1F5F9),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Icon(Icons.arrow_forward_outlined),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgOutlinedButton(
                  icon: SvgIcons.google,
                  padding: EdgeInsets.symmetric(vertical: 22),
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
                SvgOutlinedButton(
                  icon: SvgIcons.email,
                  padding: EdgeInsets.symmetric(vertical: 22),
                  onPressed: () async =>
                      await web3AuthProvider.loginWithEmail(),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
