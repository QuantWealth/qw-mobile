import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quantwealth/app/theme/icons.dart';
import 'package:quantwealth/app/theme/theme.dart';
import 'package:quantwealth/ui/auth/cubit/auth_cubit.dart';
import 'package:quantwealth/ui/common/icon_outlined_button.dart';
import 'package:quantwealth/ui/common/icon_outlined_text_button.dart';
import 'package:quantwealth/ui/common/widgets/base_scaffold.dart';

class AuthView extends StatefulWidget {
  final Function() onWalletConnect;
  final Function(SocialAuthType) onSocialAuth;

  const AuthView({
    super.key,
    required this.onWalletConnect,
    required this.onSocialAuth,
  });

  @override
  State<AuthView> createState() => _AuthViewState();
}

class _AuthViewState extends State<AuthView> {
  late final TextEditingController emailController;

  @override
  void initState() {
    emailController = TextEditingController();
    super.initState();
  }
  // column payment task will mammal attract mouse direct can modify loud expand

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      bgImage: 'assets/images/qw_login_bg.png',
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              height: 80.0,
              width: 80.0,
              child: SvgPicture.asset('assets/icons/logo.svg'),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Let\'s setup your account',
                  style: TextStyle(
                    fontSize: 18,
                    color: white,
                    fontFamily: 'GalanoGrotesque',
                  ),
                ),
                SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconOutlinedTextButton(
                      title: 'MetaMask',
                      assetIcon: SvgIcons.metamask,
                      onPressed: () => widget.onWalletConnect(),
                    ),
                    IconOutlinedTextButton(
                      title: 'Coinbase',
                      assetIcon: SvgIcons.coinbase,
                      onPressed: () => widget.onWalletConnect(),
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
                      onPressed: () => widget.onWalletConnect(),
                    ),
                  ],
                ),
                SizedBox(height: 80),
                Text(
                  'or continue with socials',
                  style: TextStyle(
                    fontSize: 18,
                    color: white,
                    fontFamily: 'GalanoGrotesque',
                  ),
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
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 24,
                              vertical: 20,
                            ),
                            hintText: 'Enter your email...',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(color: Color(0xFFE2E8F0)),
                            ),
                            hintStyle: TextStyle(
                              color: white.withOpacity(0.4),
                              fontWeight: FontWeight.normal,
                              fontSize: 14,
                              fontFamily: 'GalanoGrotesque',
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 20),
                      SizedBox(
                        height: 68,
                        width: 54,
                        child: ElevatedButton(
                          onPressed: () {},
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
                      onPressed: () =>
                          widget.onSocialAuth(SocialAuthType.google),
                    ),
                    SizedBox(width: 9),
                    IconOutlinedButton(
                      icon: Icons.apple,
                      color: Colors.white,
                      onPressed: () =>
                          widget.onSocialAuth(SocialAuthType.apple),
                    ),
                    SizedBox(width: 9),
                    SvgOutlinedButton(
                      icon: SvgIcons.email,
                      padding: EdgeInsets.symmetric(vertical: 22),
                      onPressed: () =>
                          widget.onSocialAuth(SocialAuthType.email),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
