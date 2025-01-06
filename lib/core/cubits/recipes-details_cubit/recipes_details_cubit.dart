import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:recpie_app/core/repos/shared_repos.dart';

import '../../data/models/recipe_model/recipe_model.dart';
import '../../data/models/recipe_model/specific_ingredients.dart';

part 'recipes_details_state.dart';

class RecipeDetailsCubit extends Cubit<RecipeDetailsState> {
  RecipeDetailsCubit(this.sharedRepos) : super(RecipeDetailsInitial());
  final SharedRepos sharedRepos;

  Future<void> fetchRecipeDetails({required int recipeId}) async {
    emit(RecipeDetailsLoading());
    final ingredientsResult =
        await sharedRepos.fetchIngredientsForRecipe(recipeId);
    final similarRecipesResult =
        await sharedRepos.fetchSimilarRecipes(recipeId);

    ingredientsResult.fold(
      (failure) => emit(RecipeDetailsFailure(failure.errMessage)),
      (recipeDetails) {
        similarRecipesResult.fold(
          (failure) => emit(RecipeDetailsFailure(failure.errMessage)),
          (similarRecipes) => emit(RecipeDetailsSuccess(
              ingredients: recipeDetails, similarRecipes: similarRecipes)),
        );
      },
    );
  }
}
