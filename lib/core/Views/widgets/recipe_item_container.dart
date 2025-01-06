import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:recpie_app/core/Views/widgets/rating_container.dart';
import 'package:recpie_app/core/Views/widgets/recipe_info_container.dart';

import '../../../../../core/data/models/recipe_model/recipe_model.dart';
import '../../data/models/user_model/small_recipe_model.dart';
import 'custom_favourite_circle_button.dart';

class RecipeItemContainer extends StatelessWidget {
  const RecipeItemContainer({
    super.key,
    required this.recipe,
  });
  final RecipeModel recipe;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .3,
      width: MediaQuery.of(context).size.width * 0.85,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned.fill(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(
                  15), // Ensures image respects border radius
              child: CachedNetworkImage(
                fit: BoxFit.fitWidth,
                imageUrl: recipe.image ?? ' ', // Optional: Placeholder
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
          ),
          Positioned(
            left: 0,
            bottom: 0,
            right: 0,
            child: RecipeInfoContainer(
              model: recipe,
            ),
          ),
          Positioned(
            top: 10,
            left: 8,
            child: RatingContainer(
              model: recipe,
            ),
          ),
          Positioned(
            top: 10,
            right: 8,
            child: CustomFavouriteCircleButton(
              recipe: SmallRecipeModel(
                title: recipe.title ?? '',
                aggregateLikes: recipe.aggregateLikes ?? '',
                image: recipe.image ?? '',
                id: recipe.id,
                spoonacularScore: recipe.spoonacularScore,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
