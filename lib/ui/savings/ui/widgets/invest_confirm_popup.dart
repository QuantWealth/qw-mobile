import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:quantwealth/app/theme/theme.dart';
import 'package:quantwealth/ui/common/text_filled_button.dart';
import 'package:quantwealth/ui/common/text_outlined_button.dart';

class InvestConfirmPopup extends StatefulWidget {
  final VoidCallback onContinue;
  final String title;
  final String description;

  const InvestConfirmPopup({
    super.key,
    required this.onContinue,
    required this.title,
    required this.description,
  });

  static show(
    BuildContext context, {
    required String title,
    required String description,
    required VoidCallback onContinue,
  }) {
    showDialog(
      context: context,
      builder: (context) => InvestConfirmPopup(
        title: title,
        description: description,
        onContinue: onContinue,
      ),
    );
  }

  @override
  State<InvestConfirmPopup> createState() => _InvestConfirmPopupState();
}

class _InvestConfirmPopupState extends State<InvestConfirmPopup> {
  bool _agreedTerms = false;

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
      child: Dialog(
        child: Container(
          padding: const EdgeInsets.all(24.0),
          decoration: BoxDecoration(
            color: white,
            borderRadius: BorderRadius.circular(22.0),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                widget.title,
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'GalanoGrotesque',
                ),
              ),
              const SizedBox(height: 16.0),
              Text(
                widget.description,
                style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'GalanoGrotesque',
                ),
              ),
              const SizedBox(height: 16.0),
              GestureDetector(
                onTap: () => setState(() => _agreedTerms = !_agreedTerms),
                child: Row(
                  children: [
                    Checkbox(
                      value: _agreedTerms,
                      activeColor: black,
                      checkColor: white,
                      onChanged: (val) =>
                          setState(() => _agreedTerms = val ?? false),
                    ),
                    const SizedBox(width: 12.0),
                    Text(
                      'Agree with this',
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'GalanoGrotesque',
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24.0),
              Row(
                children: [
                  Expanded(
                    child: TextOutlinedButton(
                      text: 'Go back',
                      padding: const EdgeInsets.all(16.0),
                      textStyle: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                        fontFamily: 'GalanoGrotesque',
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  SizedBox(width: 12.0),
                  Expanded(
                    child: Opacity(
                      opacity: _agreedTerms ? 1.0 : 0.5,
                      child: TextFilledButton(
                        text: 'Confirm',
                        padding: const EdgeInsets.all(16.0),
                        textStyle: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                          color: white,
                          fontFamily: 'GalanoGrotesque',
                        ),
                        onPressed: _agreedTerms
                            ? () {
                                Navigator.pop(context);
                                widget.onContinue();
                              }
                            : null,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
