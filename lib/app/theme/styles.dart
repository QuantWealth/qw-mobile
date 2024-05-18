import 'package:flutter/material.dart';

class Styles {
  static ButtonStyle outlinedButtonStyle = OutlinedButton.styleFrom(
    elevation: .0,
    enableFeedback: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
    ),
    textStyle: TextStyle(
      fontWeight: FontWeight.bold,
      fontFamily: 'GalanoGrotesque',
    ),
    padding: EdgeInsets.symmetric(vertical: 16),
    side: BorderSide(width: 0.84, color: Color(0xFFE2E8F0)),
  );
}
