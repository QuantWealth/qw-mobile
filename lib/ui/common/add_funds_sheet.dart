import 'package:flutter/material.dart';
import 'package:quantwealth/app/extensions.dart';
import 'package:quantwealth/ui/common/text_outlined_button.dart';
import 'package:quantwealth/ui/receive/ui/receive_page.dart';
import 'package:quantwealth/ui/savings/infrastructure/datasource/approved_tx_dto.dart';

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
            onPressed: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                backgroundColor: Colors.white,
                builder: (_) => TransactionApprovePopup(
                  meta: MetaTxData(
                    to: '0x665d8a50912FC42A88233e9eA53e70980dcb9Ecd',
                    data: '0x665d8a50912FC42A88233e9eA53e70980dcb9Ecd',
                    value: '0x665d8a50912FC42A88233e9eA53e70980dcb9Ecd',
                  ),
                ),
              );
            },
          ),
          SizedBox(height: 18),
          TextOutlinedButton(
            text: 'Apple Pay',
            onPressed: () {},
          ),
          SizedBox(height: 18),
          TextOutlinedButton(
            text: 'Crypto Transfer',
            onPressed: () => context.navigator.push(
              ReceivePage(
                address: '0x665d8a50912FC42A88233e9eA53e70980dcb9Ecd',
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

class TransactionApprovePopup extends StatelessWidget {
  final MetaTxData meta;

  const TransactionApprovePopup({
    super.key,
    required this.meta,
  });

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
            'Approve Transaction',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w900,
              fontFamily: 'GalanoGrotesque',
            ),
          ),
          SizedBox(height: 24),
          Text(
            'Approve the transaction to deposit funds into your account',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              fontFamily: 'GalanoGrotesque',
            ),
          ),
          SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'To',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'GalanoGrotesque',
                ),
              ),
              Text(
                meta.to,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'GalanoGrotesque',
                ),
              ),
            ],
          ),
          SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Value',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'GalanoGrotesque',
                ),
              ),
              Text(
                meta.value,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'GalanoGrotesque',
                ),
              ),
            ],
          ),
          SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Data',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'GalanoGrotesque',
                ),
              ),
              Text(
                meta.data,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'GalanoGrotesque',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
