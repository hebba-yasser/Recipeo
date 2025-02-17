import 'package:flutter/material.dart';
import 'package:recpie_app/core/Views/widgets/rating_container.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../data/models/user_model/small_recipe_model.dart';
import '../../styles/fonts.dart';
import 'custom_favourite_circle_button.dart';
import 'custom_image.dart';

class SquareRecipeItem extends StatelessWidget {
  const SquareRecipeItem({
    super.key,
    required this.model,
    required this.aspectRatio,
  });

  final model;
  final double aspectRatio;
  @override
  Widget build(BuildContext context) {
    //height: MediaQuery.of(context).size.height * 0.24 + 56,
    return SizedBox(
      width: 150, // height: 300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Skeleton.ignore(
                child: SizedBox(
                  //width: 150,
                  height: 200,
                  child: CustomImage(
                    imgUrl: model.image ?? '',
                    aspectRatio: aspectRatio,
                  ),
                ),
              ),
              Positioned(
                top: 5,
                left: 12,
                child: RatingContainer(model: model),
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            children: [
              Expanded(
                flex: 2,
                child: Text(
                  model.title ?? '',
                  style: AppFonts.bodyText16,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  // Ellipsis for overflow
                ),
              ),
              Expanded(
                flex: 1,
                child: CustomFavouriteCircleButton(
                  recipe: SmallRecipeModel(
                    title: model.title ?? '',
                    aggregateLikes: model.aggregateLikes ?? '',
                    image: model.image ?? '',
                    id: model.id,
                    spoonacularScore: model.spoonacularScore,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
