import 'package:flutter/material.dart';

import '../../../../../core/styles/fonts.dart';

class IngredientItem extends StatelessWidget {
  const IngredientItem(
      {super.key, required this.unit, required this.text, this.subtext});

  final String unit;
  final String text;
  final String? subtext;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: ListTile(
          contentPadding: const EdgeInsets.all(0),
          horizontalTitleGap: 5,
          leading: CircleAvatar(
            radius: 14,
            backgroundColor: Colors.greenAccent.withOpacity(.4),
            child: const Icon(
              size: 20,
              Icons.check,
              color: Colors.green,
            ),
          ),
          title: Text(
            '$unit $text',
            style: AppFonts.bodyText16.copyWith(fontWeight: FontWeight.bold),
          ),
          subtitle: subtext != null
              ? Text(
                  '($subtext)',
                  style: AppFonts.bodyText16,
                )
              : null),
    );
  }
}
