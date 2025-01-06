import 'package:flutter/cupertino.dart';
import 'package:recpie_app/core/Views/widgets/square_recpie_item.dart';
import 'package:recpie_app/core/data/models/recipe_model/recipe_model.dart';

import '../../utils/functions/Navigaor_push.dart';
import '../recipe_details_view.dart';

class RelatedRecipeGridView extends StatelessWidget {
  const RelatedRecipeGridView({
    super.key,
    required this.similarRecipes,
  });
  final List<RecipeModel> similarRecipes;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: 2 / 3,
        crossAxisCount: 2, // Specify number of columns
        crossAxisSpacing: 5, // Space between columns
        mainAxisSpacing: 5,
      ),
      itemBuilder: (context, index) => GestureDetector(
        onTap: () {
          navigatorPush(
              context,
              RecipeDetailsView(
                recipeModel: similarRecipes[index],
              ));
        },
        child: SquareRecipeItem(
            aspectRatio: 2 / 2.4, model: similarRecipes[index]),
      ),
      itemCount: similarRecipes.length,
    );
  }
}
