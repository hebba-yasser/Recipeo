import 'package:flutter/material.dart';
import 'package:recpie_app/core/Views/widgets/related_recipes_view_body.dart';

import '../data/models/recipe_model/recipe_model.dart';

class RelatedRecipesView extends StatelessWidget {
  const RelatedRecipesView(
      {super.key, required this.recipeName, required this.similarRecipes});
  final String recipeName;
  final List<RecipeModel> similarRecipes;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: RelatedRecipesViewBody(
        similarRecipes: similarRecipes,
        recipeName: recipeName,
      )),
    );
  }
}
