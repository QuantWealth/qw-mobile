import 'package:flutter/material.dart';
import 'package:quantwealth/app/theme/theme.dart';

class DefaultButton extends StatelessWidget {
  final VoidCallback onPressed;
  final double roundedRadius;
  final String label;
  final bool isLoading;
  final bool isSelected;
  final double fontSize;
  final EdgeInsetsGeometry? padding;

  const DefaultButton({
    super.key,
    required this.onPressed,
    this.roundedRadius = .0,
    required this.label,
    this.isLoading = false,
    this.isSelected = false,
    this.fontSize = 16.0,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
          padding: padding,
          foregroundColor: white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
            side: BorderSide(color: white),
          ),
          backgroundColor: Colors.transparent,
          textStyle: TextStyle(
            fontSize: fontSize,
            fontFamily: 'GalanoGrotesque',
            fontWeight: FontWeight.w500,
          )),
      child: Text(label),
    );
  }
}
