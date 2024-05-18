import 'package:flutter/material.dart';
import 'package:quantwealth/ui/common/text_outlined_button.dart';

class AddFundsSheet extends StatelessWidget {
  const AddFundsSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 35),
          Text(
            'Deposit Via',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w900,
              fontFamily: 'GalanoGrotesque',
            ),
          ),
          SizedBox(height: 24),
          TextOutlinedButton(
            text: 'Bank Transfer',
            onPressed: () {},
          ),
          SizedBox(height: 18),
          TextOutlinedButton(
            text: 'Apple Pay',
            onPressed: () {},
          ),
          SizedBox(height: 18),
          TextOutlinedButton(
            text: 'Crypto Transfer',
            onPressed: () {},
          ),
          SizedBox(height: 18),
          TextOutlinedButton(
            text: 'Exchange Transfer',
            onPressed: () {},
          ),
          SizedBox(height: 18),
          TextOutlinedButton(
            text: 'Wallet Address',
            onPressed: () {},
          ),
          SizedBox(height: 50),
        ],
      ),
    );
  }
}
