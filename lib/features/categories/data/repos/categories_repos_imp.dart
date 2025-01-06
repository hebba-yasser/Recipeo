import 'dart:math';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:recpie_app/core/errors/failure.dart';

import '../../../../../core/data/models/recipe_model/recipe_model.dart';
import '../../../../core/utils/api_service.dart';
import 'categories_repos.dart';

class CategoryReposImp implements CategoryRepos {
  final ApiService apiService;

  CategoryReposImp(this.apiService);

  final String? api = dotenv.env['API_KEY2'];

  @override
  int generateRandomOffset() => Random().nextInt(30);
  @override
  Future<Either<Failure, List<RecipeModel>>> fetchMealTypeRecipes(
      {required String type}) async {
    try {
      int offset = generateRandomOffset();
      var data = await apiService.get(
          endPoint:
              'complexSearch?apiKey=$api&addRecipeInformation=true&addRecipeInstructions=true&addRecipeNutrition=true&&type=$type&offset=$offset');
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
  Future<Either<Failure, List<RecipeModel>>> fetchCuisineRecipes(
      {required String cuisine}) async {
    try {
      int offset = generateRandomOffset();
      var data = await apiService.get(
          endPoint:
              'complexSearch?apiKey=$api&addRecipeInformation=true&addRecipeInstructions=true&addRecipeNutrition=true&&cuisine=$cuisine&offset=$offset');
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
  Future<Either<Failure, List<RecipeModel>>> fetchDietRecipes(
      {required String diet}) async {
    try {
      int offset = generateRandomOffset();
      var data = await apiService.get(
          endPoint:
              'complexSearch?apiKey=$api&addRecipeInformation=true&addRecipeInstructions=true&addRecipeNutrition=true&&diet=$diet&offset=$offset');
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
  Future<Either<Failure, List<RecipeModel>>> fetchIntoleranceRecipes(
      {required String intolerances}) async {
    try {
      int offset = generateRandomOffset();
      var data = await apiService.get(
          endPoint:
              'complexSearch?apiKey=$api&addRecipeInformation=true&addRecipeInstructions=true&addRecipeNutrition=true&&intolerances=$intolerances&offset=$offset');
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
  Future<Either<Failure, List<RecipeModel>>> fetchQueryRecipes(
      {required String query}) async {
    try {
      int offset = generateRandomOffset();
      var data = await apiService.get(
          endPoint:
              'complexSearch?apiKey=$api&addRecipeInformation=true&addRecipeInstructions=true&addRecipeNutrition=true&&query=$query&offset=$offset');
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
  Future<Either<Failure, RecipeModel>> fetchRandomRecipe() async {
    try {
      var data = await apiService.get(
          endPoint: 'random?apiKey=$api&number=1&includeNutrition=true');
      RecipeModel recipe;
      recipe = RecipeModel.fromJson(data['recipes'][0]);
      return Right(recipe);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
