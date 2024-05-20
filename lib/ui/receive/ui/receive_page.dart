import 'package:flutter/material.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';
import 'package:quantwealth/app/extensions.dart';
import 'package:quantwealth/app/strings.dart';
import 'package:quantwealth/app/theme/theme.dart';
import 'package:quantwealth/ui/common/widgets/base_scaffold.dart';
import 'package:quantwealth/ui/common/widgets/default_button.dart';
import 'package:share_plus/share_plus.dart';

class ReceivePage extends StatelessWidget {
  final String address;
  final String image;

  const ReceivePage({
    super.key,
    required this.address,
    this.image = 'assets/images/eth_logo.png',
  });

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      title: Strings.labelYourAddress,
      isCenterTitle: true,
      onBack: () => context.navigator.pop(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: SizedBox(
              height: 200,
              child: PrettyQrView.data(
                data: address,
                decoration: PrettyQrDecoration(
                  shape: const PrettyQrSmoothSymbol(),
                  image: PrettyQrDecorationImage(
                    image: AssetImage(image),
                  ),
                  background: Colors.white,
                ),
              ),
            ),
          ),
          SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  Strings.labelYourAddress,
                  style: fontB(20),
                ),
                SizedBox(height: 4),
                Text(
                  Strings.labelInfoAddress,
                  style: fontR(16),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 8.0,
          horizontal: 12,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: double.maxFinite,
              child: DefaultButton(
                onPressed: () {
                  // Copy address to clipboard
                },
                // add a logo here for indicating copy
                label: address.truncate(),
                fontSize: 16.0,
                padding: const EdgeInsets.symmetric(
                  vertical: 18.0,
                ),
              ),
            ),
            SizedBox(height: 12.0),
            SizedBox(
              width: double.maxFinite,
              child: DefaultButton(
                onPressed: () => Share.share(address),
                label: Strings.labelShare,
                fontSize: 16.0,
                padding: const EdgeInsets.symmetric(
                  vertical: 18.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
