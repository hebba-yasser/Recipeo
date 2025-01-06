import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:recpie_app/core/repos/shared_repos.dart';

import '../../constants.dart';
import '../data/models/recipe_model/recipe_model.dart';
import '../data/models/recipe_model/specific_ingredients.dart';
import '../data/models/user_model/small_recipe_model.dart';
import '../data/models/user_model/user_model.dart';
import '../errors/failure.dart';
import '../utils/api_service.dart';

class SharedReposImp implements SharedRepos {
  final ApiService apiService;

  SharedReposImp(this.apiService);

  final String? api = dotenv.env['API_KEY4'];

  @override
  Future<Either<Failure, List<SpecificIngredients>>> fetchIngredientsForRecipe(
      int? recipeId) async {
    try {
      var ingredientData = await apiService.get(
          endPoint: '$recipeId/ingredientWidget.json?apiKey=$api');

      List<SpecificIngredients> specificIngredients =
          (ingredientData['ingredients'] as List)
              .map((ingredient) => SpecificIngredients.fromJson(ingredient))
              .toList();
      return Right(specificIngredients);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<RecipeModel>>> fetchSimilarRecipes(
      int? recipeId) async {
    try {
      var data =
          await apiService.getList(endPoint: '$recipeId/similar?apiKey=$api');
      List similarRecipeIds = data.map((recipe) => recipe["id"]).toList();
      var data2 = await apiService.getList(
          endPoint:
              'informationBulk?ids=$similarRecipeIds&apiKey=$api&includeNutrition=true');
      List<RecipeModel> similarRecipes = [];
      for (var item in data2) {
        similarRecipes.add(RecipeModel.fromJson(item));
      }
      return Right(similarRecipes);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Stream<Either<Failure, UserModel>> fetchUserData(
      {required String id}) async* {
    try {
      final userDoc =
          FirebaseFirestore.instance.collection('users').doc(id).snapshots();
      await for (var snapshot in userDoc) {
        if (snapshot.exists) {
          final userData = UserModel.fromMap(snapshot.data()!);
          yield Right(userData);
        } else {
          yield Left(FirebaseFailure('There is no data available'));
        }
      }
    } catch (e) {
      if (e is FirebaseAuthException) {
        yield Left(FirebaseFailure.fromFirebaseAuthException(e));
      } else {
        yield Left(FirebaseFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, UserModel>> updateUserPreferences({
    required UserModel user,
    required String userId,
  }) async {
    try {
      final userDoc =
          FirebaseFirestore.instance.collection('users').doc(userId);
      await userDoc.update({'preferences': user.preferences?.toJson()});
      final updatedData = await userDoc.get();
      final updatedUser = UserModel.fromMap(updatedData.data()!);
      return Right(updatedUser);
    } catch (e) {
      if (e is FirebaseAuthException) {
        return left(FirebaseFailure.fromFirebaseAuthException(e));
      } else {
        return left(FirebaseFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, void>> updateUserFavourites(
      {required SmallRecipeModel recipe}) async {
    try {
      final userRef = FirebaseFirestore.instance.collection('users').doc(uId);
      final userDoc = await userRef.get();
      if (userDoc.exists) {
        final userData = UserModel.fromMap(userDoc.data()!);
        final likedRecipeIds =
            userData.likedRecipes?.map((e) => e.id).toList() ?? [];

        if (likedRecipeIds.contains(recipe.id)) {
          print('remove');

          await userRef.update(
            {
              'likedRecipes': FieldValue.arrayRemove([recipe.toJson()])
            },
          );
          return right(null);
        } else {
          print('add');
          await userRef.update(
            {
              'likedRecipes': FieldValue.arrayUnion([recipe.toJson()])
            },
          );
          return right(null);
        }
      } else {
        return left(FirebaseFailure('there was an error :no recipe found'));
      }
    } catch (e) {
      if (e is FirebaseAuthException) {
        return left(FirebaseFailure.fromFirebaseAuthException(e));
      } else {
        return left(FirebaseFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, RecipeModel>> fetchRecipeById(
      {required int id}) async {
    try {
      var data = await apiService.get(
          endPoint: '$id/information?apiKey=$api&includeNutrition=true');
      RecipeModel recipe;
      recipe = RecipeModel.fromJson(data);
      return Right(recipe);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
