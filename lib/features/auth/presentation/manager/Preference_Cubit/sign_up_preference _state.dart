import 'package:flutter/cupertino.dart';

@immutable
sealed class SignUpPreferenceState {}

final class SignUpPreferenceInitial extends SignUpPreferenceState {}

final class SignUpPreferenceSelected extends SignUpPreferenceState {}

final class SignUpExcludedIngSelected extends SignUpPreferenceState {}

final class SignUpExcludedIngRemoved extends SignUpPreferenceState {}

final class SignUpSavePreferencesLoading extends SignUpPreferenceState {}

final class SignUpSavePreferencesSuccess extends SignUpPreferenceState {}

final class SignUpSavePreferencesError extends SignUpPreferenceState {
  final String errMessage;

  SignUpSavePreferencesError(this.errMessage);
}
