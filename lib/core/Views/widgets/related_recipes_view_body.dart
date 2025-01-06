import 'package:flutter/material.dart';
import 'package:recpie_app/core/Views/widgets/related_recipe_grid_view.dart';
import 'package:recpie_app/core/styles/fonts.dart';

import '../../../../../core/data/models/recipe_model/recipe_model.dart';
import 'custom_back_button.dart';

class RelatedRecipesViewBody extends StatelessWidget {
  const RelatedRecipesViewBody(
      {super.key, required this.recipeName, required this.similarRecipes});
  final String recipeName;
  final List<RecipeModel> similarRecipes;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          contentPadding: const EdgeInsets.only(left: 12),
          leading: const CustomBackButton(),
          title: Text(
            'Related to',
            style: AppFonts.bodyText16.copyWith(color: Colors.black54),
          ),
          subtitle: Text(
            recipeName,
            style: AppFonts.bodyText18,
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: RelatedRecipeGridView(
              similarRecipes: similarRecipes,
            ),
          ),
        )
      ],
    );
  }
}
