import 'package:bloc/bloc.dart';
import 'package:recpie_app/features/Search/data/repos/search_repos.dart';
import 'package:recpie_app/features/Search/presetation/manager/update_recent_search_cubit/update_recent_search_cubit.dart';

import 'fetch_recipe_by_id_state.dart';

class FetchRecipeByIdCubit extends Cubit<FetchRecipeByIdState> {
  FetchRecipeByIdCubit(this.searchRepos, this.updateRecentSearchCubit)
      : super(FetchRecipeByIdInitial());
  final SearchRepos searchRepos;
  final UpdateRecentSearchCubit updateRecentSearchCubit;
  Future<void> fetchRecipeById({
    required int id,
  }) async {
    emit(FetchRecipeByIdLoading());
    var result = await searchRepos.fetchRecipeById(id: id);
    result.fold((failure) {
      emit(FetchRecipeByIdFailure(failure.errMessage));
    }, (recipe) async {
      emit(FetchRecipeByIdSuccess(recipe));
      await updateRecentSearchCubit.updateRecentSearch(search: recipe.title!);
    });
  }
}
