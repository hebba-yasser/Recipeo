import 'package:flutter/material.dart';

import '../../../../../core/styles/fonts.dart';

class CircleCategoryItem extends StatelessWidget {
  const CircleCategoryItem({
    super.key,
    required this.categoryName,
    required this.imagePath,
  });
  final String categoryName;
  final String imagePath;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 45,
          backgroundImage: AssetImage(imagePath),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          categoryName,
          style: AppFonts.bodyText18.copyWith(fontWeight: FontWeight.w500),
        )
      ],
    );
  }
}
