import 'package:dartz/dartz.dart';

import '../data/models/recipe_model/recipe_model.dart';
import '../data/models/recipe_model/specific_ingredients.dart';
import '../data/models/user_model/small_recipe_model.dart';
import '../data/models/user_model/user_model.dart';
import '../errors/failure.dart';

abstract class SharedRepos {
  Future<Either<Failure, List<SpecificIngredients>>> fetchIngredientsForRecipe(
      int? recipeId);

  Future<Either<Failure, List<RecipeModel>>> fetchSimilarRecipes(int? recipeId);

  Stream<Either<Failure, UserModel>> fetchUserData({required String id});

  Future<Either<Failure, UserModel>> updateUserPreferences({
    required UserModel user,
    required String userId,
  });

  Future<Either<Failure, void>> updateUserFavourites(
      {required SmallRecipeModel recipe});

  Future<Either<Failure, RecipeModel>> fetchRecipeById({required int id});
}
