import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:quantwealth/app/theme/styles.dart';
import 'package:quantwealth/ui/common/text_outlined_button.dart';

class OverviewPage extends StatefulWidget {
  const OverviewPage({super.key});

  @override
  State<OverviewPage> createState() => _OverviewPageState();
}

class _OverviewPageState extends State<OverviewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
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
        ),
      ),
    );
  }
}

class AddFundsSheet extends StatelessWidget {
  const AddFundsSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          SizedBox(height: 35),
          Text(
            'Deposit Via',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w900,
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
        ],
      ),
    );
  }
}
