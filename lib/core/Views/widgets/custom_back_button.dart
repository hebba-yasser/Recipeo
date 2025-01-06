import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../styles/colors.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton(
      {super.key,
      this.backgroundColor = kprimaryColor,
      this.foregroundColor = AppColors.lightPeach,
      this.iconColor = Colors.white});
  final Color backgroundColor;
  final Color foregroundColor;
  final Color iconColor;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: backgroundColor,
      foregroundColor: foregroundColor,
      child: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(
          Icons.arrow_back_rounded,
          color: iconColor,
        ),
      ),
    );
  }
}
