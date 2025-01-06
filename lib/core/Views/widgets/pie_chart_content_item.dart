import 'package:flutter/material.dart';

import '../../../../../core/styles/fonts.dart';

class PieChartContentItem extends StatelessWidget {
  const PieChartContentItem({
    super.key,
    required this.color,
    required this.text,
    required this.percentage,
  });

  final Color color;
  final String text;
  final String percentage;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 12),
      horizontalTitleGap: 5,
      minTileHeight: 10,
      leading: Container(
        height: 18,
        width: 18,
        decoration:
            BoxDecoration(color: color, borderRadius: BorderRadius.circular(5)),
      ),
      title: Text(
        text,
        style: AppFonts.bodyText14
            .copyWith(fontWeight: FontWeight.w500), // Custom font style
      ),
      trailing: Text(
        percentage,
        style: AppFonts.bodyText14
            .copyWith(fontWeight: FontWeight.w500), // Custom font style
      ),
    );
  }
}
