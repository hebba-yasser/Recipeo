import 'package:flutter/material.dart';
import 'package:recpie_app/core/Views/widgets/square_recpie_item.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../data/models/recipe_model/recipe_model.dart';
import 'collection_title.dart';

class SkeletonizedSquareRecipes extends StatelessWidget {
  const SkeletonizedSquareRecipes({super.key});

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
          Container(
            height: 300,
            //270
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black12, width: 1),
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      ),
                    ),
                    child: SquareRecipeItem(
                      aspectRatio: 2 / 2.4,
                      model: RecipeModel(
                        title:
                            'dummy titleeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeerrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr',
                        spoonacularScore: '0.0',
                        aggregateLikes: '0.0',
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
