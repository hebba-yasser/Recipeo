part of 'suggestions_cubit.dart';

@immutable
sealed class SuggestionsState {}

final class SuggestionsInitial extends SuggestionsState {}

final class SuggestionsLoading extends SuggestionsState {}

final class SuggestionSuccess extends SuggestionsState {
  final List<SuggestionsModel> suggestions;

  SuggestionSuccess(this.suggestions);
}

final class SuggestionFailure extends SuggestionsState {
  final String errMessage;

  SuggestionFailure(this.errMessage);
}

final class SuggestionsTyping extends SuggestionsState {
  final bool isTyping;

  SuggestionsTyping({required this.isTyping});
}
