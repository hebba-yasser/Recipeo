import 'package:dartz/dartz.dart';

import '../../../../core/data/models/recipe_model/recipe_model.dart';
import '../../../../core/data/models/user_model/collections_model.dart';
import '../../../../core/data/models/user_model/small_recipe_model.dart';
import '../../../../core/errors/failure.dart';

abstract class LibraryRepos {
  Future<Either<Failure, RecipeModel>> fetchRecipeById({required int id});
  Future<Either<Failure, void>> addCollection(
      {required CollectionModel collection});

  Future<Either<Failure, List<CollectionModel>>> fetchCollections(
      {required String id});
  Stream<Either<Failure, CollectionModel>> fetchRecipesOfCollection({
    required String collectionId,
  });

  Future<Either<Failure, void>> updateCollection(
      {required CollectionModel collection});

  Future<Either<Failure, void>> deleteCollection(
      {required CollectionModel collection});
  Future<Either<Failure, void>> removeRecipesFromCollection({
    required String collectionId,
    required List<SmallRecipeModel> recipesList,
  });

  Future<Either<Failure, void>> moveRecipe({
    required String removeCollectionId,
    required String newCollectionId,
    required List<SmallRecipeModel> recipesList,
  });
}
