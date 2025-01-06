import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../styles/colors.dart';
import '../../styles/fonts.dart';

class CustomFilterShip extends StatelessWidget {
  const CustomFilterShip({
    super.key,
    required this.displayedFilterList,
    required this.selectedList,
    required this.onSelectedFunction,
  });

  final List displayedFilterList;
  final List selectedList;
  final onSelectedFunction;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 0),
      child: Wrap(
        spacing: 5.0,
        children: displayedFilterList.map((label) {
          return FilterChip(
            label: Text(
              label,
            ),
            disabledColor: Colors.white,
            selected: selectedList.contains(label),
            selectedColor: kprimaryColor,
            labelStyle: AppFonts.bodyText16,
            shadowColor: Colors.white,
            selectedShadowColor: Colors.white,
            surfaceTintColor: Colors.white,
            backgroundColor: AppColors.cream,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            showCheckmark: false,
            side: const BorderSide(width: 2, color: AppColors.lightPeach),
            onSelected: (value) {
              onSelectedFunction(selectedList, label);
            },
          );
        }).toList(),
      ),
    );
  }
}
