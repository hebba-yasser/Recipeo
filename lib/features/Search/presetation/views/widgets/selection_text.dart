import 'package:flutter/material.dart';

import '../../../../../constants.dart';
import '../../../../../core/styles/fonts.dart';

class SelectionText extends StatelessWidget {
  const SelectionText({
    super.key,
    required this.cubitSelectedChips,
    required this.title,
  });

  final List<dynamic> cubitSelectedChips;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Row(
          children: [
            Text(
              'Selected $title: ',
              style: AppFonts.bodyText16
                  .copyWith(color: kprimaryColor, fontWeight: FontWeight.bold),
            ),
            (cubitSelectedChips.isNotEmpty)
                ? Text(
                    cubitSelectedChips.join(', '),
                    style: AppFonts.bodyText16.copyWith(color: Colors.black),
                  )
                : Text(
                    'none',
                    style: AppFonts.bodyText16.copyWith(color: Colors.black),
                  ),
          ],
        ));
  }
}
