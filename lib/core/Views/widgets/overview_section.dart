import 'package:flutter/material.dart';
import 'package:recpie_app/core/Views/widgets/square_recipe_body.dart';

import '../../../../../core/data/models/recipe_model/recipe_model.dart';
import 'custom_divider.dart';
import 'overview_diet_sction.dart';
import 'overview_item.dart';

class OverviewSection extends StatelessWidget {
  const OverviewSection({
    super.key,
    required this.model,
    required this.similarRecipes,
  });

  final RecipeModel model;
  final List<RecipeModel> similarRecipes;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        OverviewItem(
            text: 'Rating',
            icon: Icons.star_rate_rounded,
            units: model.spoonacularScore ?? ' '),
        const CustomDivider(),
        OverviewItem(
          text: 'Servings',
          icon: Icons.room_service,
          units: model.servings ?? '',
        ),
        const CustomDivider(),
        OverviewItem(
          text: 'Calories per servings',
          icon: Icons.local_fire_department_rounded,
          units: model.nutrition!.getAmount('calories'),
        ),
        const CustomDivider(),
        OverviewItem(
          text: 'Total Time',
          icon: Icons.timelapse,
          units: model.readyInMinutes != null
              ? ("${model.readyInMinutes} Mins")
              : ' ',
        ),
        const CustomDivider(),
        OverviewDietsSection(
          diets: model.diets ?? [],
        ),
        const CustomDivider(),
        SquareRecipeBody(
          similarRecipes: similarRecipes,
          relatedName: model.title ?? '',
          title: 'Related Recipes',
          isRelated: true,
        )
      ],
    );
  }
}
