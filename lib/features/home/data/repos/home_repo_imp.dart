import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:recpie_app/core/errors/failure.dart';
import 'package:recpie_app/core/repos/shared_repos.dart';
import 'package:recpie_app/core/utils/api_service.dart';
import 'package:recpie_app/features/home/data/repos/home_repo.dart';

import '../../../../../core/data/models/recipe_model/recipe_model.dart';
import '../../../../core/data/models/user_model/user_model.dart';

class HomeRepoImp implements HomeRepo {
  final ApiService apiService;
  final SharedRepos sharedRepos;

  HomeRepoImp(this.apiService, this.sharedRepos);
  final String? api = dotenv.env['API_KEY1'];
  @override
  int generateRandomOffset() => Random().nextInt(21);

  @override
  Future<Either<Failure, List<RecipeModel>>> fetchPopularRecipes() async {
    try {
      int offset = generateRandomOffset();
      var data = await apiService.get(
          endPoint:
              'complexSearch?apiKey=$api&addRecipeInformation=true&addRecipeInstructions=true&addRecipeNutrition=true&sort=popularity&offset=$offset');
      List<RecipeModel> recipes = [];
      for (var item in data['results']) {
        recipes.add(RecipeModel.fromJson(item));
      }

      return Right(recipes);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<RecipeModel>>> fetchHighlyRatedRecipes() async {
    try {
      int offset = generateRandomOffset();

      var data = await apiService.get(
          endPoint:
              'complexSearch?apiKey=$api&addRecipeInformation=true&addRecipeInstructions=true&addRecipeNutrition=true&sort=meta-score&sortDirection=desc&offset=$offset');
      List<RecipeModel> recipes = [];
      for (var item in data['results']) {
        recipes.add(RecipeModel.fromJson(item));
      }
      return Right(recipes);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<RecipeModel>>> fetchHealthyRecipes() async {
    try {
      int offset = generateRandomOffset();

      var data = await apiService.get(
          endPoint:
              'complexSearch?apiKey=$api&addRecipeInformation=true&addRecipeInstructions=true&addRecipeNutrition=true&sort=healthiness&offset=$offset');
      List<RecipeModel> recipes = [];
      for (var item in data['results']) {
        recipes.add(RecipeModel.fromJson(item));
      }
      return Right(recipes);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<RecipeModel>>> fetchEasyRecipes() async {
    try {
      int offset = generateRandomOffset();

      var data = await apiService.get(
          endPoint:
              'complexSearch?apiKey=$api&addRecipeInformation=true&addRecipeInstructions=true&addRecipeNutrition=true&maxReadyTime=25&sortDirection=asc&sort=time&offset=$offset');

      List<RecipeModel> recipes = [];
      for (var item in data['results']) {
        recipes.add(RecipeModel.fromJson(item));
      }
      return Right(recipes);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<RecipeModel>>> fetchPersonalizedRecipe({
    required String id,
  }) async {
    try {
      final userDoc =
          await FirebaseFirestore.instance.collection('users').doc(id).get();
      final userData = UserModel.fromMap(userDoc.data()!);
      var data = await apiService.get(
          endPoint:
              'complexSearch?apiKey=$api&addRecipeInformation=true&addRecipeInstructions=true&addRecipeNutrition=true&cuisine=${userData.preferences?.favouriteCuisines}&diet=${userData.preferences?.diets}&intolerances=${userData.preferences?.allergies}&excludeIngredients=${userData.preferences?.excludedIngredients}');
      List<RecipeModel> recipes = [];
      for (var item in data['results']) {
        recipes.add(RecipeModel.fromJson(item));
      }

      return Right(recipes);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
