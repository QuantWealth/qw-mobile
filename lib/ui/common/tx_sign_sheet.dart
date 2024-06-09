import 'package:flutter/material.dart';
import 'package:quantwealth/app/extensions.dart';
import 'package:quantwealth/app/theme/theme.dart';
import 'package:quantwealth/ui/common/text_outlined_button.dart';
import 'package:quantwealth/ui/savings/infrastructure/datasource/approved_tx_dto.dart';

class TxSignSheet extends StatelessWidget {
  final ApprovedTxDto tx;
  final Function() onSign;

  const TxSignSheet({
    super.key,
    required this.tx,
    required this.onSign,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
      child: Wrap(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10),
              Center(
                child: Text(
                  'Sign this message?',
                  style: fontB(22),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'You are about to sign this message to approve the transaction.',
                style: fontR(16),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              Text(
                'To Address',
                style: fontSB(16),
              ),
              SizedBox(height: 10),
              Container(
                height: 50,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white.withOpacity(.3)),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      tx.txData.to,
                      style: fontR(
                        16,
                        color: Colors.grey.withOpacity(0.9),
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Metadata',
                style: fontSB(16),
              ),
              SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white.withOpacity(.3)),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      tx.txData.data,
                      style: fontR(
                        16,
                        color: Colors.grey.withOpacity(0.9),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Transaction Data',
                style: fontSB(16),
              ),
              SizedBox(height: 10),
              Container(
                height: 150,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white.withOpacity(.3)),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Scrollbar(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(
                        tx.typedData,
                        style: fontR(
                          16,
                          color: Colors.grey.withOpacity(0.9),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30),
              Row(
                children: [
                  Expanded(
                    child: TextOutlinedButton(
                      text: 'Cancel',
                      onPressed: () => context.navigator.pop(),
                      textStyle: fontSB(16),
                      borderColor: Colors.grey.withOpacity(0.9),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: TextOutlinedButton(
                      text: 'Sign',
                      onPressed: () => onSign(),
                      textStyle: fontSB(16),
                      borderColor: Colors.grey.withOpacity(0.9),
                    ),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
