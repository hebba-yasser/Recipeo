import 'package:flutter/material.dart';

class CustomCircleButton extends StatelessWidget {
  const CustomCircleButton({
    super.key,
    required this.onPressed,
    required this.icon,
    required this.backgroundColor,
    required this.clickColor,
    required this.iconColor,
    this.radius,
    this.iconSize,
  });

  final void Function() onPressed;
  final IconData icon;
  final Color backgroundColor;
  final Color clickColor;
  final Color iconColor;
  final double? radius;
  final double? iconSize;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundColor: backgroundColor,
      child: IconButton(
        iconSize: iconSize,
        onPressed: onPressed,
        highlightColor: clickColor,
        icon: Stack(
          children: [
            Icon(
              icon,
              color: iconColor,
            ),
          ],
        ),
      ),
    );
  }
}
