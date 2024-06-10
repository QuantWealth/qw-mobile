import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quantwealth/app/theme/styles.dart';
import 'package:quantwealth/app/theme/theme.dart';

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
      style: Styles.outlinedButtonStyle,
      onPressed: onPressed,
      child: Icon(
        icon,
        size: 30,
        color: color,
      ),
    );
  }
}

class SvgOutlinedButton extends StatelessWidget {
  final String icon;
  final double? height;
  final Function() onPressed;
  final EdgeInsetsGeometry? padding;

  const SvgOutlinedButton({
    super.key,
    this.height = 20,
    this.padding,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: Styles.outlinedButtonStyle
          .copyWith(padding: WidgetStatePropertyAll(padding)),
      onPressed: onPressed,
      child: SvgPicture.asset(icon,
          height: height,
          theme: SvgTheme(
            currentColor: white,
          )),
    );
  }
}
