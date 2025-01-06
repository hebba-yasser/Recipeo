import 'package:flutter/cupertino.dart';
import 'package:recpie_app/core/Views/widgets/recipe_item_container.dart';

import '../../../../../core/data/models/recipe_model/recipe_model.dart';
import '../../utils/functions/Navigaor_push.dart';
import '../recipe_details_view.dart';

class RecipesListView extends StatelessWidget {
  const RecipesListView({
    super.key,
    required this.recipes,
  });
  final List<RecipeModel> recipes;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: recipes.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.only(
            top: 8,
          ),
          child: GestureDetector(
            onTap: () {
              navigatorPush(
                  context,
                  RecipeDetailsView(
                    recipeModel: recipes[index],
                  ));
            },
            child: RecipeItemContainer(
              recipe: recipes[index],
            ),
          ),
        ),
      ),
    );
  }
}
