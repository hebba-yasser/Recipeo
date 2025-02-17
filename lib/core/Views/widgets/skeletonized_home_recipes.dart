import 'package:flutter/material.dart';
import 'package:recpie_app/core/Views/widgets/recipe_item_container.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../data/models/recipe_model/recipe_model.dart';
import 'collection_title.dart';

class SkeletonizedHomeRecipes extends StatelessWidget {
  const SkeletonizedHomeRecipes({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      child: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
            child: CollectionTitle(
              title: 'Dummy Title',
              onPressed: () {},
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * .3,
            child: RecipeItemContainer(
              recipe: RecipeModel(
                title: 'dummy title                          e',
                spoonacularScore: '0.0',
                aggregateLikes: '0.0',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
