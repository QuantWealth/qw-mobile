import 'package:flutter/material.dart';
import 'package:quantwealth/app/theme/styles.dart';
import 'package:quantwealth/ui/common/add_funds_sheet.dart';

class BalancePage extends StatelessWidget {
  const BalancePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Overall Balance',
            style: TextStyle(
              fontSize: 24,
            ),
          ),
          SizedBox(height: 8),
          Text(
            '\$55.00',
            style: TextStyle(
              fontSize: 48,
              fontWeight: FontWeight.w900,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 40.0),
            child: OutlinedButton(
              onPressed: () => showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                backgroundColor: Colors.white,
                builder: (_) => AddFundsSheet(),
              ),
              style: Styles.outlinedButtonStyle.copyWith(
                padding: MaterialStatePropertyAll(
                  EdgeInsets.symmetric(
                    vertical: 16,
                    horizontal: 32,
                  ),
                ),
                side: MaterialStateProperty.all(
                  BorderSide(
                    color: Colors.black,
                  ),
                ),
              ),
              child: Text(
                'Add Funds',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              'Show Assets',
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),
          )
        ],
      ),
    );
  }
}
