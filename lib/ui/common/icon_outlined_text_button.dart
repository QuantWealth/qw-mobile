import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IconOutlinedTextButton extends StatelessWidget {
  final String title;
  final String assetIcon;
  final Color primaryColor;
  final double elevation;
  final Function() onPressed;

  const IconOutlinedTextButton({
    super.key,
    required this.title,
    required this.assetIcon,
    this.elevation = 0.0,
    this.primaryColor = Colors.black,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        elevation: elevation,
        enableFeedback: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        textStyle: TextStyle(fontWeight: FontWeight.bold),
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        side: BorderSide(width: 2, color: Color(0xFFE2E8F0)),
      ),
      onPressed: onPressed,
      child: Row(
        children: [
          SvgPicture.asset(
            assetIcon,
            width: 20,
          ),
          SizedBox(width: 6),
          Text(
            title,
            style: TextStyle(color: primaryColor),
          ),
        ],
      ),
    );
  }
}
