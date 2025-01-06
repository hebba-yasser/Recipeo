import 'package:flutter/material.dart';
import 'package:recpie_app/core/styles/fonts.dart';

import '../../../../../core/data/models/recipe_model/recipe_model.dart';
import '../../../constants.dart';
import 'custom_tab.dart';

class CustomTapBar extends StatelessWidget {
  const CustomTapBar({
    super.key,
    required this.model,
  });
  final RecipeModel model;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white, // Styling your TabBar
      child: TabBar(
        unselectedLabelStyle: AppFonts.bodyText16.copyWith(
          fontWeight: FontWeight.bold,
        ),
        labelStyle: AppFonts.bodyText16.copyWith(
          fontWeight: FontWeight.bold,
          color: kprimaryColor,
        ),
        isScrollable: true,
        tabAlignment: TabAlignment.start,
        indicatorColor: kprimaryColor,
        physics: const BouncingScrollPhysics(),
        tabs: [
          const CustomTab(
            title: 'Overview',
            subtitle: '',
          ),
          CustomTab(
            title: 'Ingredients',
            subtitle: "${model.nutrition?.ingredients?.length} items",
          ),
          CustomTab(
            title: 'Directions',
            subtitle: "${model.readyInMinutes}m",
          ),
          const CustomTab(
            title: 'Nutrition',
            subtitle: '',
          ),
        ],
      ),
    );
  }
}
