import 'package:flutter/material.dart';

import '../../../../../core/styles/colors.dart';
import '../../../../../core/styles/fonts.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key,
    required this.categoryName,
    required this.imagePath,
  });
  final String categoryName;
  final String imagePath;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.cream,
      elevation: 6,
      shadowColor: AppColors.lightPeach,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
        trailing: ClipOval(
          child: Image.asset(
            imagePath,
            width: 50, // Set the width of the image
            height: 50, // Set the height of the image
            fit: BoxFit.cover,
          ),
        ),
        title: Text(
          categoryName,
          style: AppFonts.bodyText16.copyWith(
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
