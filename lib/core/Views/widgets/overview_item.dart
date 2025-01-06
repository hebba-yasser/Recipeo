import 'package:flutter/material.dart';

import '../../../../../constants.dart';
import '../../../../../core/styles/fonts.dart';

class OverviewItem extends StatelessWidget {
  const OverviewItem({
    super.key,
    required this.text,
    required this.icon,
    required this.units,
  });

  final String text;
  final String units;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: ListTile(
        contentPadding: const EdgeInsets.all(0),
        horizontalTitleGap: 5,
        leading: Icon(
          icon,
          color: kprimaryColor,
        ),
        title: Text(
          text,
          style: AppFonts.bodyText16,
        ),
        trailing: Text(
          units,
          style: AppFonts.bodyText14,
        ),
      ),
    );
  }
}
