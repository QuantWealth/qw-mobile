import 'package:flutter/material.dart';
import 'package:quantwealth/app/theme/styles.dart';

class TextOutlinedButton extends StatelessWidget {
  final String text;
  final EdgeInsetsGeometry? padding;
  final TextStyle? textStyle;
  final Function()? onPressed;
  final Color borderColor;

  const TextOutlinedButton({
    super.key,
    this.onPressed,
    required this.text,
    this.padding,
    this.textStyle,
    this.borderColor = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton(
        onPressed: onPressed,
        style: Styles.outlinedButtonStyle.copyWith(
          padding: WidgetStatePropertyAll(
            padding ??
                EdgeInsets.symmetric(
                  vertical: 16,
                  horizontal: 32,
                ),
          ),
          side: WidgetStateProperty.all(
            BorderSide(color: borderColor),
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
