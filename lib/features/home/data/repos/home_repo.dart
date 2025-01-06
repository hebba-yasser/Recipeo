import 'package:dartz/dartz.dart';
import 'package:recpie_app/core/errors/failure.dart';

import '../../../../core/data/models/recipe_model/recipe_model.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<RecipeModel>>> fetchPopularRecipes();
  Future<Either<Failure, List<RecipeModel>>> fetchHealthyRecipes();
  Future<Either<Failure, List<RecipeModel>>> fetchHighlyRatedRecipes();
  Future<Either<Failure, List<RecipeModel>>> fetchEasyRecipes();
  int generateRandomOffset();
  Future<Either<Failure, List<RecipeModel>>> fetchPersonalizedRecipe({
    required String id,
  });
}
