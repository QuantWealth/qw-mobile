import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quantwealth/app/strings.dart';
import 'package:quantwealth/app/theme/theme.dart';
import 'package:quantwealth/ui/savings/cubit/savings_cubit.dart';
import 'package:quantwealth/ui/savings/ui/widgets/savings_item_button.dart';

class StakingPage extends StatefulWidget {
  const StakingPage({super.key});

  @override
  State<StakingPage> createState() => _StakingPageState();
}

class _StakingPageState extends State<StakingPage> {
  final FocusNode _focusNode = FocusNode();
  bool _fieldInFocus = false;

  @override
  void initState() {
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
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 46.0,
      fontFamily: 'GalanoGrotesque',
    );

    return Column(
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
                            enabled: false,
                            focusNode: _focusNode,
                            onChanged: (x) {},
                            style: inputStyle,
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Coming soon...',
                              hintStyle: inputStyle.copyWith(
                                fontSize: 40,
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
                            onPressed: () {},
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
                    children: const [
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
                          '3000',
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
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 43.0),
          child: SavingsItemButton(
            onPressed: () {},
            name: 'BTC',
            apy: '5%',
            isSelected: true,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 43.0),
          child: SavingsItemButton(
            onPressed: () {},
            name: 'ETH',
            apy: '5%',
            isSelected: false,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 43.0),
          child: SavingsItemButton(
            onPressed: () {},
            name: 'More',
            apy: 'Coming Soon',
            isSelected: false,
          ),
        ),
      ],
    );
  }
}
