import 'package:flutter/material.dart';

import '../../../../../constants.dart';
import '../../../../../core/styles/fonts.dart';

class Button extends StatelessWidget {
  const Button({
    super.key,
    required this.onPressed,
    required this.selectedList,
  });
  final Function() onPressed;
  final List<String> selectedList;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 30,
      right: 0,
      child: selectedList.isEmpty
          ? OutlinedButton(
              onPressed: onPressed,
              style: OutlinedButton.styleFrom(
                side: BorderSide(width: 4.0, color: kprimaryColor),
              ),
              child: Text(
                'Skip',
                style: AppFonts.heading20.copyWith(color: Colors.grey),
              ),
            )
          : OutlinedButton(
              onPressed: onPressed,
              style: OutlinedButton.styleFrom(
                side: BorderSide(width: 4.0, color: kprimaryColor),
              ),
              child: Text(
                'Done',
                style: AppFonts.heading20.copyWith(color: kprimaryColor),
              ),
            ),
    );
  }
}
