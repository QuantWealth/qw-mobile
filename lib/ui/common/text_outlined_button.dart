import 'package:flutter/material.dart';
import 'package:quantwealth/app/theme/styles.dart';

class TextOutlinedButton extends StatelessWidget {
  final String text;
  final Function()? onPressed;

  const TextOutlinedButton({
    super.key,
    this.onPressed,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton(
        onPressed: onPressed,
        style: Styles.outlinedButtonStyle.copyWith(
          padding: MaterialStatePropertyAll(
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
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.normal,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
