import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:recpie_app/features/Search/data/repos/search_repos.dart';

import '../../../../../core/data/models/recipe_model/recipe_model.dart';
import '../update_recent_search_cubit/update_recent_search_cubit.dart';

part 'search_recipes_state.dart';

class SearchRecipesCubit extends Cubit<SearchRecipesState> {
  SearchRecipesCubit(
    this.searchRepos,
    this.updateRecentSearchCubit,
  ) : super(SearchRecipesInitial());
  final SearchRepos searchRepos;
  final UpdateRecentSearchCubit updateRecentSearchCubit;

  Future<void> searchRecipes(
      {required List<String> cuisine,
      required List<String> type,
      required List<String> diet,
      required List<String> intolerances,
      required String? query,
      required List<String> includeIngredients,
      required List<String> excludedIngredients}) async {
    emit(SearchRecipesLoading());
    var result = await searchRepos.searchRecipe(
        cuisine: cuisine,
        type: type,
        diet: diet,
        intolerances: intolerances,
        query: query ?? '',
        includeIngredients: includeIngredients,
        excludedIngredients: excludedIngredients);
    result.fold((failure) {
      emit(SearchRecipesFailure(failure.errMessage));
    }, (recipes) async {
      emit(SearchRecipesSuccess(recipes));
      if (query != null) {
        await updateRecentSearchCubit.updateRecentSearch(search: query);
      }
    });
  }
}
