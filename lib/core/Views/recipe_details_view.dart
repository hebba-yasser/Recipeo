import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recpie_app/core/Views/widgets/recipe_details_view_body.dart';

import '../cubits/recipes-details_cubit/recipes_details_cubit.dart';
import '../data/models/recipe_model/recipe_model.dart';
import '../repos/shared_repos_imp.dart';
import '../utils/functions/custom_loading_indicator.dart';
import '../utils/service_locator.dart';

class RecipeDetailsView extends StatelessWidget {
  const RecipeDetailsView({super.key, required this.recipeModel});

  final RecipeModel recipeModel;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RecipeDetailsCubit(getIt.get<SharedReposImp>())
        ..fetchRecipeDetails(
          recipeId: recipeModel.id!,
        ),
      child: Scaffold(
        body: BlocBuilder<RecipeDetailsCubit, RecipeDetailsState>(
          builder: (context, state) {
            if (state is RecipeDetailsSuccess) {
              return RecipeDetailsViewBody(
                recipeModel: recipeModel,
                ingredients: state.ingredients,
                similarRecipes: state.similarRecipes,
              );
            } else if (state is RecipeDetailsFailure) {
              return Center(
                child: Text(
                  state.errMessage,
                  textAlign: TextAlign.center,
                ),
              );
            } else {
              return customLoadingIndicator();
            }
          },
        ),
      ),
    );
  }
}
