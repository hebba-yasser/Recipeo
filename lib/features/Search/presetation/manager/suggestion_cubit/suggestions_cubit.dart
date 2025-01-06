import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:recpie_app/features/Search/data/repos/search_repos.dart';

import '../../../data/model/auto_complete_search_model.dart';

part 'suggestions_state.dart';

class SuggestionsCubit extends Cubit<SuggestionsState> {
  SuggestionsCubit(this.searchRepos) : super(SuggestionsInitial());
  final SearchRepos searchRepos;
  final TextEditingController controller = TextEditingController();
  void startTyping() {
    emit(SuggestionsTyping(isTyping: true));
  }

  void stopTyping() {
    emit(SuggestionsTyping(isTyping: false));
  }

  Future<void> fetchSuggestions({
    required String query,
  }) async {
    emit(SuggestionsLoading());
    var result = await searchRepos.fetchSuggestions(query: query);
    result.fold((failure) {
      emit(SuggestionFailure(failure.errMessage));
    }, (suggestion) {
      emit(SuggestionSuccess(suggestion));
    });
  }
}
