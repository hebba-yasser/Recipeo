part of 'highly_rated_recipes_cubit.dart';

@immutable
sealed class HighlyRatedRecipesState {}

final class HighlyRatedRecipesInitial extends HighlyRatedRecipesState {}

final class HighlyRatedRecipesLoading extends HighlyRatedRecipesState {}

final class HighlyRatedRecipesSuccess extends HighlyRatedRecipesState {
  final List<RecipeModel> recipes;
  HighlyRatedRecipesSuccess(this.recipes);
}

final class HighlyRatedRecipesFailure extends HighlyRatedRecipesState {
  final String errMessage;
  HighlyRatedRecipesFailure(this.errMessage);
}
