import 'package:flutter/cupertino.dart';

@immutable
sealed class UpdateFavouritesState {}

final class UpdateFavouritesInitial extends UpdateFavouritesState {}

final class UpdateFavouritesLoading extends UpdateFavouritesState {}

final class UpdateFavouritesSuccess extends UpdateFavouritesState {}

final class UpdateFavouritesFailure extends UpdateFavouritesState {
  final String errMessage;

  UpdateFavouritesFailure(this.errMessage);
}
