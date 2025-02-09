import 'package:flutter/cupertino.dart';
import 'package:recpie_app/core/data/models/user_model/collections_model.dart';

@immutable
sealed class FetchRecipesOfCollectionState {}

final class FetchRecipesOfCollectionInitial
    extends FetchRecipesOfCollectionState {}

final class FetchRecipesOfCollectionLoading
    extends FetchRecipesOfCollectionState {}

final class FetchRecipesOfCollectionSuccess
    extends FetchRecipesOfCollectionState {
  final CollectionModel recipes;
  FetchRecipesOfCollectionSuccess(this.recipes);
}

final class FetchRecipesOfCollectionFailure
    extends FetchRecipesOfCollectionState {
  final String errMessage;
  FetchRecipesOfCollectionFailure(this.errMessage);
}
