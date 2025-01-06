import 'package:flutter/cupertino.dart';

@immutable
sealed class UpdateProfileState {}

final class UpdateProfileInitial extends UpdateProfileState {}

final class UpdateProfileLoading extends UpdateProfileState {}

final class UpdateProfileSuccess extends UpdateProfileState {}

final class UpdateProfileFailure extends UpdateProfileState {
  final String errMessage;

  UpdateProfileFailure(this.errMessage);
}

final class UpdateEmailLoading extends UpdateProfileState {}

final class UpdateEmailSuccess extends UpdateProfileState {}

final class UpdateEmailFailure extends UpdateProfileState {
  final String errMessage;

  UpdateEmailFailure(this.errMessage);
}

final class PickedImageSuccess extends UpdateProfileState {}

final class PickedImageFailure extends UpdateProfileState {
  final String errMessage;

  PickedImageFailure(this.errMessage);
}

final class UploadImageToSupabaseLoading extends UpdateProfileState {}

final class UploadImageToSupabaseSuccess extends UpdateProfileState {}

final class UploadImageToSupabaseFailure extends UpdateProfileState {
  final String errMessage;

  UploadImageToSupabaseFailure(this.errMessage);
}

final class UpdateImageLoading extends UpdateProfileState {}

final class UpdateImageSuccess extends UpdateProfileState {}

final class UpdateImageFailure extends UpdateProfileState {
  final String errMessage;

  UpdateImageFailure(this.errMessage);
}
