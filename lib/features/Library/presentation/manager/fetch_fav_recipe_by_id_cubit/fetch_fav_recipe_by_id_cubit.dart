import 'package:bloc/bloc.dart';
import 'package:recpie_app/features/Library/data/repos/Library_repos.dart';

import 'fetch_fav_recipe_by_id__state.dart';

class FetchFavRecipeByIdCubit extends Cubit<FetchFavRecipeByIdState> {
  FetchFavRecipeByIdCubit(this.libraryRepos)
      : super(FetchFavRecipeByIdInitial());
  final LibraryRepos libraryRepos;
  Future<void> fetchRecipeById({
    required int id,
  }) async {
    emit(FetchFavRecipeByIdLoading());
    var result = await libraryRepos.fetchRecipeById(id: id);
    result.fold((failure) {
      emit(FetchFavRecipeByIdFailure(failure.errMessage));
    }, (recipe) async {
      emit(FetchFavRecipeByIdSuccess(recipe));
    });
  }
}
