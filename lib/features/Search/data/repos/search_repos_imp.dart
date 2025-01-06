import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:recpie_app/core/errors/failure.dart';
import 'package:recpie_app/core/repos/shared_repos.dart';
import 'package:recpie_app/core/utils/api_service.dart';
import 'package:recpie_app/features/Search/data/model/auto_complete_search_model.dart';
import 'package:recpie_app/features/Search/data/repos/search_repos.dart';

import '../../../../constants.dart';
import '../../../../core/data/models/recipe_model/recipe_model.dart';

class SearchReposImp implements SearchRepos {
  final ApiService apiService;
  final SharedRepos sharedRepos;
  SearchReposImp(this.apiService, this.sharedRepos);

  final String? api = dotenv.env['API_KEY3'];

  @override
  Future<Either<Failure, List<RecipeModel>>> searchRecipe(
      {required List<String> cuisine,
      required List<String> type,
      required List<String> diet,
      required List<String> intolerances,
      required String query,
      required List<String> includeIngredients,
      required List<String> excludedIngredients}) async {
    try {
      var data = await apiService.get(
          endPoint:
              'complexSearch?apiKey=$api&addRecipeInformation=true&addRecipeInstructions=true&addRecipeNutrition=true&query=$query&type=$type&cuisine=$cuisine&diet=$diet&intolerances=$intolerances&includeIngredients=$includeIngredients&excludeIngredients=$excludedIngredients');
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
  Future<Either<Failure, List<SuggestionsModel>>> fetchSuggestions(
      {required String query}) async {
    try {
      var data = await apiService.getList(
          endPoint: 'autocomplete?apiKey=$api&query=$query');
      List<SuggestionsModel> suggestions = [];
      for (var item in data) {
        suggestions.add(SuggestionsModel.fromJson(item));
      }
      return Right(suggestions);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, RecipeModel>> fetchRecipeById(
      {required int id}) async {
    return await sharedRepos.fetchRecipeById(id: id);
  }

  @override
  Future<Either<Failure, List<RecipeModel>>> fetchRecipesByQuery(
      {required String query}) async {
    try {
      var data = await apiService.get(
          endPoint:
              'complexSearch?apiKey=$api&addRecipeInformation=true&addRecipeInstructions=true&addRecipeNutrition=true&query=$query');
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
  Future<Either<Failure, void>> updateUserSearchList({
    required String search,
  }) async {
    try {
      final userDoc = FirebaseFirestore.instance.collection('users').doc(uId);
      final snapshot = await userDoc.get();

      List<String> recentSearches = [];
      if (snapshot.exists && snapshot.data()!['recentSearch'] != null) {
        recentSearches = List<String>.from(snapshot.data()!['recentSearch']);
      }
      if (!recentSearches.contains(search)) {
        recentSearches.insert(0, search);
      }
      if (recentSearches.length > 10) {
        recentSearches = recentSearches.sublist(0, 10);
      }
      await userDoc.update({'recentSearch': recentSearches});
      return const Right(null);
      // final userDoc = FirebaseFirestore.instance.collection('users').doc(uId);
      // await userDoc.update({'recentSearch': search});
      // final updatedData = await userDoc.get();
      // final updatedUser = UserModel.fromMap(updatedData.data()!);
      // return Right(updatedUser);
    } catch (e) {
      if (e is FirebaseAuthException) {
        return left(FirebaseFailure.fromFirebaseAuthException(e));
      } else {
        return left(FirebaseFailure(e.toString()));
      }
    }
  }
}
