import 'package:flutter/material.dart';

import '../../../../../core/data/models/recipe_model/recipe_model.dart';
import '../../data/models/recipe_model/specific_ingredients.dart';
import 'custom_divider.dart';
import 'ingredient_item.dart';

class IngredientSection extends StatelessWidget {
  const IngredientSection({
    super.key,
    required this.model,
    required this.ingredients,
  });
  final RecipeModel model;
  final List<SpecificIngredients> ingredients;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (context, index) => IngredientItem(
              unit:
                  '${ingredients[index].amount?.metric?.value} ${ingredients[index].amount?.metric?.unit}',
              text: ingredients[index].name ?? '',
              subtext: null,
            ),
        separatorBuilder: (context, index) => const CustomDivider(),
        itemCount: ingredients.length);
  }
}
