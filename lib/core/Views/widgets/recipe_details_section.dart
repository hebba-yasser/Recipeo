import 'package:flutter/material.dart';

import '../../../../../core/data/models/recipe_model/recipe_model.dart';
import '../../data/models/recipe_model/specific_ingredients.dart';
import 'custom_tap_bar.dart';
import 'direction_section.dart';
import 'ingredient_section.dart';
import 'nutrition_section.dart';
import 'overview_section.dart';

class RecipeDetailsSection extends StatelessWidget {
  const RecipeDetailsSection({
    super.key,
    required bool isSliverAppBarCollapsed,
    required this.model,
    required this.ingredients,
    required this.similarRecipes,
  }) : _isSliverAppBarCollapsed = isSliverAppBarCollapsed;
  final List<SpecificIngredients> ingredients;
  final List<RecipeModel> similarRecipes;

  final bool _isSliverAppBarCollapsed;
  final RecipeModel model;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Container(
        color: Colors.white,
        child: ListView(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          children: [
            if (_isSliverAppBarCollapsed) const SizedBox(height: 50),
            CustomTapBar(
              model: model,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.8,
              child: TabBarView(
                children: [
                  OverviewSection(
                    similarRecipes: similarRecipes,
                    model: model,
                  ),
                  IngredientSection(
                    ingredients: ingredients,
                    model: model,
                  ),
                  DirectionSection(
                    model: model,
                  ),
                  NutritionSection(
                    model: model,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
