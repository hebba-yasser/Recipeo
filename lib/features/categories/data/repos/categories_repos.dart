import 'package:dartz/dartz.dart';
import 'package:recpie_app/core/errors/failure.dart';

import '../../../../../core/data/models/recipe_model/recipe_model.dart';

abstract class CategoryRepos {
  Future<Either<Failure, List<RecipeModel>>> fetchMealTypeRecipes(
      {required String type});

  Future<Either<Failure, List<RecipeModel>>> fetchCuisineRecipes(
      {required String cuisine});

  Future<Either<Failure, List<RecipeModel>>> fetchDietRecipes(
      {required String diet});

  Future<Either<Failure, List<RecipeModel>>> fetchIntoleranceRecipes(
      {required String intolerances});

  Future<Either<Failure, List<RecipeModel>>> fetchQueryRecipes(
      {required String query});

  Future<Either<Failure, RecipeModel>> fetchRandomRecipe();
  int generateRandomOffset();
}
