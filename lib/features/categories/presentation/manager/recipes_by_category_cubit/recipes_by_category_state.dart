part of 'recipes_by_category_cubit.dart';

@immutable
sealed class RecipesByCategoryState {}

final class RecipesByCategoryInitial extends RecipesByCategoryState {}

final class RecipesByCategoryLoading extends RecipesByCategoryState {}

final class RecipesByCategorySuccess extends RecipesByCategoryState {
  final List<RecipeModel> recipes;

  RecipesByCategorySuccess(this.recipes);
}

final class RecipesByCategoryFailure extends RecipesByCategoryState {
  final String errMessage;

  RecipesByCategoryFailure(this.errMessage);
}
