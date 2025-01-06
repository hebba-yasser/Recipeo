import 'package:flutter/material.dart';
import 'package:recpie_app/core/data/models/user_model/small_recipe_model.dart';

import '../../../../../core/data/models/recipe_model/recipe_model.dart';
import '../../styles/fonts.dart';
import 'custom_back_button.dart';
import 'custom_favourite_circle_button.dart';

class RecipeDetailsAppBar extends StatelessWidget {
  const RecipeDetailsAppBar({
    super.key,
    required bool isSliverAppBarCollapsed,
    required this.recipeModel,
  }) : _isSliverAppBarCollapsed = isSliverAppBarCollapsed;
  final bool _isSliverAppBarCollapsed;
  final RecipeModel recipeModel;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: false,
      pinned: true,
      centerTitle: false,
      backgroundColor:
          _isSliverAppBarCollapsed ? Colors.white : Colors.transparent,
      surfaceTintColor: Colors.transparent,
      // collapsedHeight: MediaQuery.of(context).size.height * .08,
      collapsedHeight: 60,

      expandedHeight: MediaQuery.of(context).size.height * .5,
      leading: const Padding(
        padding: EdgeInsets.all(8.0),
        child: CustomBackButton(),
      ),
      flexibleSpace: FlexibleSpaceBar(
        collapseMode: CollapseMode.pin,
        background: SizedBox.expand(
          child: Stack(
            fit: StackFit.expand, // Add this
            children: [
              Positioned(
                bottom: 0.0,
                left: 0.0,
                right: 0.0,
                child: Container(
                  color: Colors.white,
                  child: ListTile(
                    trailing: CircleAvatar(
                      backgroundColor: Colors.grey,
                      radius: 21,
                      child: CustomFavouriteCircleButton(
                        recipe: SmallRecipeModel(
                          title: recipeModel.title ?? '',
                          aggregateLikes: recipeModel.aggregateLikes ?? '',
                          image: recipeModel.image ?? '',
                          id: recipeModel.id,
                          spoonacularScore: recipeModel.spoonacularScore,
                        ),
                      ),
                    ),
                    title: Text(
                      recipeModel.title ?? '',
                      style: AppFonts.heading22,
                    ),
                    subtitle: Text(
                      recipeModel.creditsText ?? '',
                      style: AppFonts.caption,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
