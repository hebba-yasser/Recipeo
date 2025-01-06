import 'package:flutter/material.dart';

import '../../../../../constants.dart';
import '../../../../../core/Views/widgets/custom_circle_button.dart';
import '../../../../../core/Views/widgets/custom_text_button.dart';
import '../../../../../core/styles/colors.dart';
import '../../../../../core/styles/fonts.dart';

class CustomClearAllAppBar extends StatelessWidget {
  const CustomClearAllAppBar(
      {super.key,
      required this.clearAllOnPressed,
      required this.exitOnPressed});

  final Function() clearAllOnPressed;
  final Function() exitOnPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomCircleButton(
            onPressed: exitOnPressed,
            icon: Icons.close,
            backgroundColor: kprimaryColor,
            clickColor: AppColors.cream,
            iconColor: Colors.white),
        CustomTextButton(
          text: 'Clear All',
          style: AppFonts.caption.copyWith(
            fontWeight: FontWeight.w500,
          ),
          onPressed: clearAllOnPressed,
        )
      ],
    );
  }
}
