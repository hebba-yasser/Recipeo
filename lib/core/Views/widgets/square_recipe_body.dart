import 'package:flutter/cupertino.dart';
import 'package:recpie_app/core/Views/recipes_view.dart';
import 'package:recpie_app/core/Views/widgets/square_recipe_list_view.dart';

import '../../../../../core/data/models/recipe_model/recipe_model.dart';
import '../../utils/functions/Navigaor_push.dart';
import '../related_recipes_view.dart';
import 'collection_title.dart';

class SquareRecipeBody extends StatelessWidget {
  const SquareRecipeBody({
    super.key,
    this.isRelated = false,
    required this.title,
    required this.similarRecipes,
    this.relatedName = '',
  });

  final bool isRelated;
  final String relatedName;
  final String title;
  final List<RecipeModel> similarRecipes;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        (isRelated)
            ? Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                child: CollectionTitle(
                  title: title,
                  onPressed: () {
                    navigatorPush(
                        context,
                        RelatedRecipesView(
                          recipeName: relatedName,
                          similarRecipes: similarRecipes,
                        ));
                  },
                ),
              )
            : Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                child: CollectionTitle(
                  title: title,
                  onPressed: () {
                    navigatorPush(context,
                        RecipesView(title: title, recipes: similarRecipes));
                  },
                ),
              ),
        SquareRecipeListView(recipes: similarRecipes),
      ],
    );
  }
}
