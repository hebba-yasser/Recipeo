import 'package:bloc/bloc.dart';
import 'package:recpie_app/features/Search/data/repos/search_repos.dart';

import '../update_recent_search_cubit/update_recent_search_cubit.dart';
import 'fetch_recipe_by_query_state.dart';

class FetchRecipeByQueryCubit extends Cubit<FetchRecipeByQueryState> {
  FetchRecipeByQueryCubit(this.searchRepos, this.updateRecentSearchCubit)
      : super(FetchRecipeByQueryInitial());
  final SearchRepos searchRepos;
  final UpdateRecentSearchCubit updateRecentSearchCubit;

  Future<void> fetchRecipeByQuery({
    required String query,
  }) async {
    emit(FetchRecipeByQueryLoading());
    var result = await searchRepos.fetchRecipesByQuery(query: query);
    result.fold((failure) {
      emit(FetchRecipeByQueryFailure(failure.errMessage));
    }, (recipe) async {
      emit(FetchRecipeByQuerySuccess(recipe));
      await updateRecentSearchCubit.updateRecentSearch(search: query);
    });
  }
}
