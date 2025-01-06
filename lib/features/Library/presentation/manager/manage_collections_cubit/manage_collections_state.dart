import 'package:flutter/cupertino.dart';

@immutable
sealed class ManageCollectionsState {}

final class ManageCollectionsInitial extends ManageCollectionsState {}

final class CreateCollectionLoading extends ManageCollectionsState {}

final class CreateCollectionSuccess extends ManageCollectionsState {}

final class CreateCollectionFailure extends ManageCollectionsState {
  final String errMessage;

  CreateCollectionFailure(this.errMessage);
}

final class RecipeSelected extends ManageCollectionsState {}

final class RecipeRemoved extends ManageCollectionsState {}

final class IsSelected extends ManageCollectionsState {
  final bool isSelected;

  IsSelected(this.isSelected);
}

final class DeleteCollectionsLoading extends ManageCollectionsState {}

final class DeleteCollectionsSuccess extends ManageCollectionsState {}

final class DeleteCollectionsFailure extends ManageCollectionsState {
  final String errMessage;

  DeleteCollectionsFailure(this.errMessage);
}

final class UpdateCollectionsLoading extends ManageCollectionsState {}

final class UpdateCollectionsSuccess extends ManageCollectionsState {}

final class UpdateCollectionsFailure extends ManageCollectionsState {
  final String errMessage;

  UpdateCollectionsFailure(this.errMessage);
}

final class MoveRecipesLoading extends ManageCollectionsState {}

final class MoveRecipesSuccess extends ManageCollectionsState {}

final class MoveRecipesFailure extends ManageCollectionsState {
  final String errMessage;

  MoveRecipesFailure(this.errMessage);
}

final class RemoveRecipesFromCollectionLoading extends ManageCollectionsState {}

final class RemoveRecipesFromCollectionSuccess extends ManageCollectionsState {}

final class RemoveRecipesFromCollectionFailure extends ManageCollectionsState {
  final String errMessage;

  RemoveRecipesFromCollectionFailure(this.errMessage);
}

final class ChangeEditState extends ManageCollectionsState {}
