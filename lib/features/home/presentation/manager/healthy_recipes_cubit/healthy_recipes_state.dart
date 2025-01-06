part of 'healthy_recipes_cubit.dart';

@immutable
sealed class HealthyRecipesState {}

final class HealthyRecipesInitial extends HealthyRecipesState {}

final class HealthyRecipesLoading extends HealthyRecipesState {}

final class HealthyRecipesSuccess extends HealthyRecipesState {
  final List<RecipeModel> recipes;
  HealthyRecipesSuccess(this.recipes);
}

final class HealthyRecipesFailure extends HealthyRecipesState {
  final String errMessage;
  HealthyRecipesFailure(this.errMessage);
}
