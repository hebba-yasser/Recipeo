import 'package:flutter/cupertino.dart';

import '../../../../../core/data/models/recipe_model/recipe_model.dart';

@immutable
sealed class FetchPersonalizedRecipesState {}

final class PersonalizedRecipesInitial extends FetchPersonalizedRecipesState {}

final class PersonalizedRecipesLoading extends FetchPersonalizedRecipesState {}

final class PersonalizedRecipesSuccess extends FetchPersonalizedRecipesState {
  final List<RecipeModel> recipes;
  PersonalizedRecipesSuccess(this.recipes);
}

final class PersonalizedRecipesFailure extends FetchPersonalizedRecipesState {
  final String errMessage;
  PersonalizedRecipesFailure(this.errMessage);
}
