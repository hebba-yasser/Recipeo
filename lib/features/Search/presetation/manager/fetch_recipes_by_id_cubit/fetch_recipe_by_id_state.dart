import 'package:flutter/cupertino.dart';

import '../../../../../core/data/models/recipe_model/recipe_model.dart';

@immutable
sealed class FetchRecipeByIdState {}

final class FetchRecipeByIdInitial extends FetchRecipeByIdState {}

final class FetchRecipeByIdLoading extends FetchRecipeByIdState {}

final class FetchRecipeByIdSuccess extends FetchRecipeByIdState {
  final RecipeModel recipe;
  FetchRecipeByIdSuccess(this.recipe);
}

final class FetchRecipeByIdFailure extends FetchRecipeByIdState {
  final String errMessage;
  FetchRecipeByIdFailure(this.errMessage);
}
