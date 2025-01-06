import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../styles/colors.dart';
import '../../styles/fonts.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.height = 55,
    this.width = double.infinity,
    required this.text,
    required this.onPressed,
    this.buttonStyle,
    this.textStyle,
    this.isButtonDisabled = false,
  });

  final double height;
  final double width;
  final String text;
  final void Function() onPressed;
  final ButtonStyle? buttonStyle;
  final TextStyle? textStyle;
  final bool isButtonDisabled;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        onPressed: isButtonDisabled ? null : onPressed,
        style: buttonStyle ??
            ElevatedButton.styleFrom(
              backgroundColor:
                  isButtonDisabled ? Colors.grey[300] : kprimaryColor,
              foregroundColor: AppColors.lightPeach,
            ),
        child: Text(
          text,
          style: textStyle ??
              AppFonts.heading20.copyWith(
                  color: isButtonDisabled ? Colors.grey : Colors.white),
        ),
      ),
    );
  }
}
