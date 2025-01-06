import 'package:flutter/cupertino.dart';

import '../../../../../core/data/models/recipe_model/recipe_model.dart';

@immutable
sealed class FetchRecipeByQueryState {}

final class FetchRecipeByQueryInitial extends FetchRecipeByQueryState {}

final class FetchRecipeByQueryLoading extends FetchRecipeByQueryState {}

final class FetchRecipeByQuerySuccess extends FetchRecipeByQueryState {
  final List<RecipeModel> recipe;
  FetchRecipeByQuerySuccess(this.recipe);
}

final class FetchRecipeByQueryFailure extends FetchRecipeByQueryState {
  final String errMessage;
  FetchRecipeByQueryFailure(this.errMessage);
}
