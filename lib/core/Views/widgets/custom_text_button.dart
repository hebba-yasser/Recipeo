import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../styles/fonts.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.style,
  });
  final String text;
  final Function() onPressed;
  final TextStyle? style;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: style ??
            AppFonts.accentBody18.copyWith(
              decoration: TextDecoration.underline,
              decorationColor: kprimaryColor,
              color: kprimaryColor,
              fontWeight: FontWeight.bold,
            ),
      ),
    );
  }
}
