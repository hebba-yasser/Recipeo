import 'package:flutter/cupertino.dart';
import 'package:recpie_app/core/Views/widgets/square_recpie_item.dart';

import '../../../../../core/data/models/recipe_model/recipe_model.dart';
import '../../utils/functions/Navigaor_push.dart';
import '../recipe_details_view.dart';

class SquareRecipeListView extends StatelessWidget {
  const SquareRecipeListView({
    super.key,
    required this.recipes,
  });
  final List<RecipeModel> recipes;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      //  height: MediaQuery.of(context).size.height * .4,
      height: 300, //270
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: recipes.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: GestureDetector(
                onTap: () {
                  navigatorPush(
                      context,
                      RecipeDetailsView(
                        recipeModel: recipes[index],
                      ));
                },
                child: SquareRecipeItem(
                  aspectRatio: 2 / 2.4,
                  model: recipes[index],
                )),
          );
        },
      ),
    );
  }
}
