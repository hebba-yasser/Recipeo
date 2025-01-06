import 'package:flutter/material.dart';

import '../../../../../constants.dart';
import '../../../../../core/styles/colors.dart';
import '../../../../../core/styles/fonts.dart';

class DirectionItem extends StatelessWidget {
  const DirectionItem({super.key, required this.text, required this.number});

  final String text;
  final String number;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: ListTile(
        contentPadding: const EdgeInsets.all(0),
        horizontalTitleGap: 5,
        leading: CircleAvatar(
          radius: 14,
          backgroundColor: AppColors.lightPeach.withOpacity(.23),
          child: Text(
            number,
            style: AppFonts.bodyText18
                .copyWith(fontWeight: FontWeight.bold, color: kprimaryColor),
          ),
        ),
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
          child: Text(
            text,
            style: AppFonts.bodyText16,
          ),
        ),
      ),
    );
  }
}
