part of 'random_recipe_cubit.dart';

@immutable
sealed class RandomRecipeState {}

final class RandomRecipeInitial extends RandomRecipeState {}

final class RandomRecipeLoading extends RandomRecipeState {}

final class RandomRecipeSuccess extends RandomRecipeState {
  final RecipeModel recipe;

  RandomRecipeSuccess(this.recipe);
}

final class RandomRecipeFailure extends RandomRecipeState {
  final String errMessage;

  RandomRecipeFailure(this.errMessage);
}
