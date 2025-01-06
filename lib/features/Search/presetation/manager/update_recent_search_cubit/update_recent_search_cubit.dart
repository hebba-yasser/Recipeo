import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recpie_app/features/Search/data/repos/search_repos.dart';
import 'package:recpie_app/features/Search/presetation/manager/update_recent_search_cubit/update_recent_search_state.dart';

class UpdateRecentSearchCubit extends Cubit<UpdateRecentSearchState> {
  UpdateRecentSearchCubit(
    this.searchRepos,
  ) : super(UpdateRecentSearchInitial());
  final SearchRepos searchRepos;
  Future<void> updateRecentSearch({required String search}) async {
    emit(UpdateRecentSearchLoading());
    var result = await searchRepos.updateUserSearchList(search: search);
    result.fold((failure) {
      emit(UpdateRecentSearchFailure(failure.errMessage));
    }, (r) async {
      emit(UpdateRecentSearchSuccess());
    });
  }
}
