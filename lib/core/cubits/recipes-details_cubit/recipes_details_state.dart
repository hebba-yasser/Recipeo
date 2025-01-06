part of 'recipes_details_cubit.dart';

@immutable
sealed class RecipeDetailsState {}

final class RecipeDetailsInitial extends RecipeDetailsState {}

final class RecipeDetailsLoading extends RecipeDetailsState {}

final class RecipeDetailsSuccess extends RecipeDetailsState {
  final List<SpecificIngredients> ingredients;
  final List<RecipeModel> similarRecipes;
  RecipeDetailsSuccess(
      {required this.ingredients, required this.similarRecipes});
}

final class RecipeDetailsFailure extends RecipeDetailsState {
  final String errMessage;
  RecipeDetailsFailure(this.errMessage);
}
