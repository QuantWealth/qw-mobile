import 'package:flutter/material.dart';

class IconOutlinedButton extends StatelessWidget {
  final IconData icon;
  final Color color;
  final Function() onPressed;

  const IconOutlinedButton({
    super.key,
    required this.icon,
    required this.onPressed,
    this.color = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        elevation: .0,
        enableFeedback: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        textStyle: TextStyle(fontWeight: FontWeight.bold),
        padding: EdgeInsets.symmetric(vertical: 16),
        side: BorderSide(width: 2, color: Color(0xFFE2E8F0)),
      ),
      onPressed: onPressed,
      child: Icon(
        icon,
        size: 30,
        color: color,
      ),
    );
  }
}
