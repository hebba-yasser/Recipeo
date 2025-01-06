part of 'profile_cubit.dart';

@immutable
sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}

final class ProfileLogOutLoading extends ProfileState {}

final class ProfileLogOutSuccess extends ProfileState {}

final class ProfileLogOutFailure extends ProfileState {
  final String errMessage;

  ProfileLogOutFailure(this.errMessage);
}
