import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:recpie_app/core/Views/widgets/recipe_details_app_bar.dart';
import 'package:recpie_app/core/Views/widgets/recipe_details_section.dart';

import '../../../../../core/data/models/recipe_model/recipe_model.dart';
import '../../data/models/recipe_model/specific_ingredients.dart';

class RecipeDetailsViewBody extends StatefulWidget {
  const RecipeDetailsViewBody(
      {super.key,
      required this.recipeModel,
      required this.ingredients,
      required this.similarRecipes});
  final RecipeModel recipeModel;
  final List<SpecificIngredients> ingredients;
  final List<RecipeModel> similarRecipes;
  @override
  State<RecipeDetailsViewBody> createState() => _RecipeDetailsViewBodyState();
}

class _RecipeDetailsViewBodyState extends State<RecipeDetailsViewBody> {
  late ScrollController _scrollController;
  bool _isSliverAppBarCollapsed = false;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();

    // Listen to scroll events
    _scrollController.addListener(() {
      setState(() {
        // Check if the SliverAppBar is collapsed
        _isSliverAppBarCollapsed = _scrollController.offset >=
            (MediaQuery.of(context).size.height * 0.5 - kToolbarHeight);
      });
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * .45,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: CachedNetworkImage(
              fit: BoxFit.cover,
              imageUrl:
                  widget.recipeModel.image ?? ' ', // Optional: Placeholder
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
        ),
        CustomScrollView(
          controller: _scrollController,
          slivers: [
            RecipeDetailsAppBar(
                recipeModel: widget.recipeModel,
                isSliverAppBarCollapsed: _isSliverAppBarCollapsed),
            SliverFillRemaining(
              hasScrollBody: true,
              child: RecipeDetailsSection(
                  similarRecipes: widget.similarRecipes,
                  ingredients: widget.ingredients,
                  model: widget.recipeModel,
                  isSliverAppBarCollapsed: _isSliverAppBarCollapsed),
            ),
          ],
        ),
      ],
    );
  }
}
