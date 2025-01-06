import 'package:flutter/cupertino.dart';

@immutable
sealed class UpdateRecentSearchState {}

final class UpdateRecentSearchInitial extends UpdateRecentSearchState {}

final class UpdateRecentSearchLoading extends UpdateRecentSearchState {}

final class UpdateRecentSearchSuccess extends UpdateRecentSearchState {}

final class UpdateRecentSearchFailure extends UpdateRecentSearchState {
  final String errMessage;

  UpdateRecentSearchFailure(this.errMessage);
}
