part of 'popular_recipes_cubit.dart';

@immutable
sealed class PopularRecipesState {}

final class PopularRecipesInitial extends PopularRecipesState {}

final class PopularRecipesLoading extends PopularRecipesState {}

final class PopularRecipesSuccess extends PopularRecipesState {
  final List<RecipeModel> recipes;
  PopularRecipesSuccess(this.recipes);
}

final class PopularRecipesFailure extends PopularRecipesState {
  final String errMessage;
  PopularRecipesFailure(this.errMessage);
}
