import 'package:flutter/material.dart';

import '../data/models/recipe_model/recipe_model.dart';
import 'widgets/custom_app_bar.dart';
import 'widgets/recipes_view_list.dart';

class RecipesView extends StatelessWidget {
  const RecipesView({
    super.key,
    required this.title,
    required this.recipes,
  });

  final String title;
  final List<RecipeModel> recipes;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
          child: Column(
            children: [
              CustomAppBar(title: title),
              RecipesListView(
                recipes: recipes,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
