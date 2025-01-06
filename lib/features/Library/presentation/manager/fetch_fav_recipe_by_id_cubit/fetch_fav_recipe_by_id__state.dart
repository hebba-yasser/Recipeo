import 'package:flutter/cupertino.dart';

import '../../../../../core/data/models/recipe_model/recipe_model.dart';

@immutable
sealed class FetchFavRecipeByIdState {}

final class FetchFavRecipeByIdInitial extends FetchFavRecipeByIdState {}

final class FetchFavRecipeByIdLoading extends FetchFavRecipeByIdState {}

final class FetchFavRecipeByIdSuccess extends FetchFavRecipeByIdState {
  final RecipeModel recipe;
  FetchFavRecipeByIdSuccess(this.recipe);
}

final class FetchFavRecipeByIdFailure extends FetchFavRecipeByIdState {
  final String errMessage;
  FetchFavRecipeByIdFailure(this.errMessage);
}
