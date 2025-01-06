part of 'easy_recipes_cubit.dart';

@immutable
sealed class EasyRecipesState {}

final class EasyRecipesInitial extends EasyRecipesState {}

final class EasyRecipesLoading extends EasyRecipesState {}

final class EasyRecipesSuccess extends EasyRecipesState {
  final List<RecipeModel> recipes;
  EasyRecipesSuccess(this.recipes);
}

final class EasyRecipesFailure extends EasyRecipesState {
  final String errMessage;
  EasyRecipesFailure(this.errMessage);
}
