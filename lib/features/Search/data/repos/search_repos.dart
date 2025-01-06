import 'package:dartz/dartz.dart';
import 'package:recpie_app/core/errors/failure.dart';
import 'package:recpie_app/features/Search/data/model/auto_complete_search_model.dart';

import '../../../../core/data/models/recipe_model/recipe_model.dart';

abstract class SearchRepos {
  Future<Either<Failure, List<SuggestionsModel>>> fetchSuggestions(
      {required String query});

  Future<Either<Failure, RecipeModel>> fetchRecipeById({required int id});

  Future<Either<Failure, List<RecipeModel>>> searchRecipe({
    required List<String> cuisine,
    required List<String> type,
    required List<String> diet,
    required List<String> intolerances,
    required String query,
    required List<String> includeIngredients,
    required List<String> excludedIngredients,
  });

  Future<Either<Failure, List<RecipeModel>>> fetchRecipesByQuery({
    required String query,
  });
  Future<Either<Failure, void>> updateUserSearchList({
    required String search,
  });
}
