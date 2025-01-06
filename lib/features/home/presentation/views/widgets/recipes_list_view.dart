import 'package:flutter/cupertino.dart';
import 'package:recpie_app/core/utils/functions/Navigaor_push.dart';

import '../../../../../core/Views/recipe_details_view.dart';
import '../../../../../core/Views/recipes_view.dart';
import '../../../../../core/Views/widgets/collection_title.dart';
import '../../../../../core/Views/widgets/recipe_item_container.dart';
import '../../../../../core/data/models/recipe_model/recipe_model.dart';

class HomeRecipesListView extends StatelessWidget {
  const HomeRecipesListView({
    super.key,
    required this.recipes,
    required this.title,
  });

  final List<RecipeModel> recipes;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
          child: CollectionTitle(
            title: title,
            onPressed: () {
              navigatorPush(
                context,
                RecipesView(
                  title: title,
                  recipes: recipes,
                ),
              );
            },
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * .3,
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: 5,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(left: 12, top: 5, bottom: 10),
                child: GestureDetector(
                    onTap: () async {
                      navigatorPush(
                        context,
                        RecipeDetailsView(
                          recipeModel: recipes[index],
                        ),
                      );
                    },
                    child: RecipeItemContainer(
                      recipe: recipes[index],
                    )),
              );
            },
          ),
        ),
      ],
    );
  }
}
