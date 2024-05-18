import 'package:flutter/material.dart';
import 'package:quantwealth/app/theme/theme.dart';

class SavingsItemButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String name;
  final String apy;
  final bool isSelected;
  const SavingsItemButton({
    super.key,
    required this.onPressed,
    required this.name,
    required this.apy,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 24.0),
      decoration: BoxDecoration(
        color: white.withOpacity(0.07),
        border: Border.all(color: white),
      ),
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          padding: const EdgeInsets.symmetric(
            horizontal: 24.0,
            vertical: 20.0,
          ),
          foregroundColor: white,
          backgroundColor: Colors.transparent,
          textStyle: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.w500,
            fontFamily: 'GalanoGrotesque',
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                name,
                style: TextStyle(
                  fontFamily: 'GalanoGrotesque',
                  color: white,
                  fontWeight: FontWeight.w700,
                  fontSize: 18.0,
                ),
              ),
            ),
            Container(
              color: qw444444,
              padding: const EdgeInsets.all(6.0),
              child: Text(
                apy,
                style: TextStyle(
                  fontFamily: 'GalanoGrotesque',
                  color: white,
                  fontWeight: FontWeight.normal,
                  fontSize: 12.0,
                ),
              ),
            ),
            // const SizedBox(width: 16.0),
            // isSelected
            //     ? Icon(
            //         Icons.check,
            //         color: white,
            //         size: 20.0,
            //       )
            //     : SizedBox(height: 20.0, width: 20.0),
          ],
        ),
      ),
    );
  }
}
