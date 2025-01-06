import 'package:flutter/material.dart';

import '../../styles/fonts.dart';
import 'custom_text_button.dart';

class CollectionTitle extends StatelessWidget {
  const CollectionTitle({
    super.key,
    required this.title,
    required this.onPressed,
  });
  final String title;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: AppFonts.heading20,
        ),
        CustomTextButton(text: 'View All', onPressed: onPressed),
      ],
    );
  }
}
