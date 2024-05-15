import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quantwealth/app/strings.dart';
import 'package:quantwealth/app/theme/theme.dart';
import 'package:quantwealth/ui/common/widgets/default_button.dart';
import 'package:quantwealth/ui/savings/cubit/savings_cubit.dart';
import 'package:quantwealth/ui/savings/infrastructure/datasource/savings_dto.dart';

class SavingsView extends StatelessWidget {
  final void Function(String) onAmountChanged;
  final void Function(AmountInputLevels) onLevelChanged;
  final void Function(SavingsDto) onSelectSavings;
  final VoidCallback onInvest;
  final List<SavingsDto> savings;
  final SavingsDto? selectedSavings;

  const SavingsView({
    super.key,
    required this.onAmountChanged,
    required this.onLevelChanged,
    required this.onSelectSavings,
    required this.onInvest,
    required this.savings,
    this.selectedSavings,
  });

  @override
  Widget build(BuildContext context) {
    final inputStyle = TextStyle(
      color: white,
      fontWeight: FontWeight.bold,
      fontSize: 46.0,
    );

    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  children: [
                    TextFormField(
                      onChanged: onAmountChanged,
                      style: inputStyle,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: Strings.hintAmountInput,
                        hintStyle: inputStyle.copyWith(
                          color: white.withOpacity(0.5),
                        ),
                        // prefixText: '\$',
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      'Input Amount (in USD)',
                      style: TextStyle(
                        color: white,
                        fontWeight: FontWeight.normal,
                        fontSize: 12.0,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 32.0),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: AmountInputLevels.uiValues
                .map((level) => TextButton(
                      onPressed: () => onLevelChanged(level),
                      style: TextButton.styleFrom(
                          foregroundColor: white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            side: BorderSide(color: white),
                          ),
                          backgroundColor: Colors.transparent,
                          textStyle: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w500,
                          )),
                      child: Text(
                        '${level.value}%',
                      ),
                    ))
                .toList(),
          ),
        ),
        const SizedBox(height: 64.0),
        ...savings.map(
          (savings) => Container(
            margin: const EdgeInsets.only(bottom: 24.0),
            decoration: BoxDecoration(
              color: white.withOpacity(0.07),
              border: Border(
                top: BorderSide(color: white),
                bottom: BorderSide(color: white),
              ),
            ),
            child: TextButton(
              onPressed: () => onSelectSavings(savings),
              style: TextButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24.0,
                  vertical: 20.0,
                ),
                foregroundColor: white,
                backgroundColor: Colors.transparent,
                textStyle: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
              child: Row(
                children: [
                  Expanded(child: Text(savings.name)),
                  Text('${savings.apy}%'),
                  const SizedBox(width: 16.0),
                  selectedSavings == savings
                      ? Icon(
                          Icons.check,
                          color: white,
                          size: 20.0,
                        )
                      : SizedBox(height: 20.0, width: 20.0),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: 100.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DefaultButton(
              onPressed: onInvest,
              label: Strings.labelInvest,
              fontSize: 22.0,
              padding: const EdgeInsets.symmetric(
                vertical: 18.0,
                horizontal: 80.0,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
