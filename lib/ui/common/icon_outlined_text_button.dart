import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quantwealth/app/theme/styles.dart';
import 'package:quantwealth/app/theme/theme.dart';

class IconOutlinedTextButton extends StatelessWidget {
  final String title;
  final String assetIcon;
  final Color primaryColor;
  final double elevation;
  final Function()? onPressed;

  const IconOutlinedTextButton({
    super.key,
    required this.title,
    required this.assetIcon,
    this.elevation = 0.0,
    this.primaryColor = white,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: Styles.outlinedButtonStyle.copyWith(
        padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
          EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        ),
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
            style: TextStyle(
              color: primaryColor,
              fontFamily: 'GalanoGrotesque',
            ),
          ),
        ],
      ),
    );
  }
}
