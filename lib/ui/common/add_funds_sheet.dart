import 'package:flutter/material.dart';
import 'package:quantwealth/app/extensions.dart';
import 'package:quantwealth/app/theme/theme.dart';
import 'package:quantwealth/injectable.dart';
import 'package:quantwealth/ui/common/text_outlined_button.dart';
import 'package:quantwealth/ui/profile/cubit/profile_cubit.dart';
import 'package:quantwealth/ui/receive/ui/receive_page.dart';

class AddFundsSheet extends StatelessWidget {
  const AddFundsSheet({super.key});

  void show(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => AddFundsSheet(),
    );
  }

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
            onPressed: () => context.navigator
              ..pop()
              ..push(
                ReceivePage(
                  address: getIt<ProfileCubit>().state.walletAddress,
                ).route(),
              ),
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

class SuccessDialog extends StatelessWidget {
  const SuccessDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Color(0xFF121212),
      title: Center(
        child: Text(
          'Investment Successful!',
          style: fontB(20),
        ),
      ),
      content: Text(
        'You have successfully invested in the selected strategy.',
        style: fontR(16),
        textAlign: TextAlign.center,
      ),
      actions: [
        Center(
          child: SizedBox(
            width: double.infinity,
            child: TextButton(
              onPressed: () => context.navigator.pop(),
              child: Text(
                'OK',
                style: fontB(20),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
