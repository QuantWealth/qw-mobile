import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quantwealth/app/strings.dart';
import 'package:quantwealth/app/theme/theme.dart';
import 'package:quantwealth/ui/savings/cubit/savings_cubit.dart';
import 'package:quantwealth/ui/savings/infrastructure/datasource/savings_dto.dart';
import 'package:quantwealth/ui/savings/ui/widgets/savings_item_button.dart';

class SavingsView extends StatefulWidget {
  final void Function(String) onAmountChanged;
  final void Function(AmountInputLevels) onLevelChanged;
  final void Function(SavingsDto) onSelectSavings;
  final VoidCallback onInvest;
  final List<SavingsDto> savings;
  final SavingsDto? selectedSavings;
  final String balance;

  const SavingsView({
    super.key,
    required this.onAmountChanged,
    required this.onLevelChanged,
    required this.onSelectSavings,
    required this.onInvest,
    required this.savings,
    this.selectedSavings,
    required this.balance,
  });

  @override
  State<SavingsView> createState() => _SavingsViewState();
}

class _SavingsViewState extends State<SavingsView> {
  final FocusNode _focusNode = FocusNode();
  late TextEditingController _amountController;
  bool _fieldInFocus = false;

  @override
  void initState() {
    _amountController = TextEditingController();
    _amountController.value = TextEditingValue(text: '200');
    _focusNode.addListener(() {
      setState(() {
        _fieldInFocus = _focusNode.hasFocus;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final inputStyle = TextStyle(
      color: white,
      fontWeight: FontWeight.bold,
      fontSize: 46.0,
      fontFamily: 'GalanoGrotesque',
    );

    return Stack(
      children: [
        ListView(
          padding: const EdgeInsets.symmetric(vertical: .0),
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              margin: EdgeInsets.all(16.0),
              curve: Curves.easeInOut,
              decoration: BoxDecoration(
                color: _fieldInFocus ? qw1D1D1D : null,
                image: _fieldInFocus
                    ? DecorationImage(
                        image: AssetImage('assets/images/qw_bg.png'),
                        fit: BoxFit.cover,
                      )
                    : null,
                // backgroundBlendMode: _fieldInFocus ? BlendMode.dst : null,
                boxShadow: [
                  BoxShadow(
                    color: _fieldInFocus
                        ? white.withOpacity(0.4)
                        : white.withOpacity(.0),
                    blurRadius: 10.0,
                    spreadRadius: 2.5,
                  ),
                ],
              ),
              child: Column(
                children: [
                  const SizedBox(height: 32.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              TextFormField(
                                controller: _amountController,
                                focusNode: _focusNode,
                                onChanged: widget.onAmountChanged,
                                style: inputStyle,
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly,
                                ],
                                textAlign: TextAlign.center,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: Strings.hintAmountInput,
                                  prefix: Text(
                                    '\$',
                                    style: inputStyle.copyWith(
                                      color: white.withOpacity(0.5),
                                    ),
                                  ),
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
                                  fontFamily: 'GalanoGrotesque',
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
                                onPressed: () => widget.onLevelChanged(level),
                                style: TextButton.styleFrom(
                                  foregroundColor: white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                    side: BorderSide(
                                      color: Colors.grey.withOpacity(.3),
                                    ),
                                  ),
                                  elevation: 10,
                                  shadowColor: Colors.grey.shade600,
                                  backgroundColor: Colors.transparent,
                                  textStyle: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                child: Text(
                                  '${level.value}%',
                                  style: TextStyle(
                                    fontFamily: 'GalanoGrotesque',
                                  ),
                                ),
                              ))
                          .toList(),
                    ),
                  ),
                  const SizedBox(height: 64.0),
                  if (_fieldInFocus)
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        children: [
                          Text(
                            'Total Asset Balance',
                            style: TextStyle(
                              color: white,
                              fontWeight: FontWeight.w300,
                              fontSize: 14.0,
                              fontFamily: 'GalanoGrotesque',
                            ),
                          ),
                          Expanded(
                            child: Text(
                              widget.balance,
                              textAlign: TextAlign.end,
                              style: TextStyle(
                                color: white,
                                fontWeight: FontWeight.w600,
                                fontSize: 14.0,
                                fontFamily: 'GalanoGrotesque',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
            if (!_fieldInFocus)
              ...widget.savings.map(
                (savings) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 43.0),
                  child: SavingsItemButton(
                    onPressed: () => widget.onSelectSavings(savings),
                    name: savings.name,
                    apy: '${savings.apy}%',
                    isSelected: widget.selectedSavings == savings,
                  ),
                ),
              ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 43.0),
              child: SavingsItemButton(
                onPressed: () {},
                name: 'Custom',
                apy: '15-30%',
                isSelected: false,
              ),
            ),
            // const SizedBox(height: 100.0),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     DefaultButton(
            //       onPressed: widget.onInvest,
            //       label: Strings.labelInvest,
            //       fontSize: 22.0,
            //       padding: const EdgeInsets.symmetric(
            //         vertical: 18.0,
            //         horizontal: 80.0,
            //       ),
            //     ),
            //   ],
            // ),
          ],
        ),
        if (_fieldInFocus)
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: widget.savings
                    .mapIndexed(
                      (idx, savings) => Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(left: idx == 1 ? 16.0 : .0),
                          child: SavingsItemButton(
                            onPressed: () => widget.onSelectSavings(savings),
                            name: savings.name,
                            apy: '${savings.apy}%',
                            isSelected: widget.selectedSavings == savings,
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
          ),
      ],
    );
  }
}
