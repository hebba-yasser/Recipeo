import 'package:flutter/cupertino.dart';

import '../../../../../core/data/models/user_model/user_model.dart';

@immutable
sealed class PreferencesState {}

final class PreferencesInitial extends PreferencesState {}

final class ClearAllPreferences extends PreferencesState {}

final class DishTypePreferencesToggleState extends PreferencesState {}

final class CuisinesPreferencesToggleState extends PreferencesState {}

final class DietsPreferencesToggleState extends PreferencesState {}

final class IntolerancePreferencesToggleState extends PreferencesState {}

class PreferencesEmpty extends PreferencesState {} // All fields are empty

class PreferencesNotEmpty extends PreferencesState {}

final class SavePreferencesLoading extends PreferencesState {}

final class SavePreferencesSuccess extends PreferencesState {
  final UserModel user;

  SavePreferencesSuccess(this.user);
}

final class SavePreferencesError extends PreferencesState {
  final String errMessage;

  SavePreferencesError(this.errMessage);
}
