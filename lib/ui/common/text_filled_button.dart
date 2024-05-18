import 'package:flutter/material.dart';
import 'package:quantwealth/app/theme/styles.dart';

class TextFilledButton extends StatelessWidget {
  final String text;
  final EdgeInsetsGeometry? padding;
  final TextStyle? textStyle;
  final Function()? onPressed;

  const TextFilledButton({
    super.key,
    this.onPressed,
    required this.text,
    this.padding,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton(
        onPressed: onPressed,
        style: Styles.outlinedButtonStyle.copyWith(
          backgroundColor: MaterialStatePropertyAll(
            Colors.black,
          ),
          padding: MaterialStatePropertyAll(
            padding ??
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
          text,
          style: textStyle ??
              TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.normal,
                color: Colors.black,
                fontFamily: 'GalanoGrotesque',
              ),
        ),
      ),
    );
  }
}
