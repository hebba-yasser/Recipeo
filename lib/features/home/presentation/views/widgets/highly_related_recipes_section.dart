import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/Views/widgets/skeletonized_square_recipes.dart';
import '../../../../../core/Views/widgets/square_recipe_body.dart';
import '../../manager/highly_rated_recipes_cubit/highly_rated_recipes_cubit.dart';

class HighlyRelatedRecipesSection extends StatelessWidget {
  const HighlyRelatedRecipesSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HighlyRatedRecipesCubit, HighlyRatedRecipesState>(
        builder: (context, state) {
      if (state is HighlyRatedRecipesSuccess) {
        return SquareRecipeBody(
          similarRecipes: state.recipes,
          title: 'Highly Rated Recipes',
        );
      } else if (state is HighlyRatedRecipesFailure) {
        return Center(
          child: Text(
            state.errMessage,
            textAlign: TextAlign.center,
          ),
        );
      } else {
        return SkeletonizedSquareRecipes();
      }
    });
  }
}
