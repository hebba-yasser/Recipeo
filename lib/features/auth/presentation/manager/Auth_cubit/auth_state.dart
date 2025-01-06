part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

//
final class AuthRegisterLoading extends AuthState {}

final class AuthRegisterSuccess extends AuthState {}

final class AuthRegisterFailure extends AuthState {
  final String errMess;

  AuthRegisterFailure({required this.errMess});
}

final class AuthLoginLoading extends AuthState {}

final class AuthLoginSuccess extends AuthState {
  final UserModel user;

  AuthLoginSuccess(this.user);
}

final class AuthLoginFailure extends AuthState {
  final String errMess;

  AuthLoginFailure({required this.errMess});
}

final class AuthLogoutLoading extends AuthState {}

final class AuthLogoutSuccess extends AuthState {}

final class AuthLogoutFailure extends AuthState {
  final String errMess;

  AuthLogoutFailure({required this.errMess});
}

final class AuthResetPasswordLoading extends AuthState {}

final class AuthResetPasswordSuccess extends AuthState {}

final class AuthResetPasswordFailure extends AuthState {
  final String errMess;

  AuthResetPasswordFailure({required this.errMess});
}

final class AuthChangedPasswordLoading extends AuthState {}

final class AuthChangedPasswordSuccess extends AuthState {}

final class AuthChangedPasswordFailure extends AuthState {
  final String errMess;

  AuthChangedPasswordFailure({required this.errMess});
}

final class AuthTogglePasswordVisibility extends AuthState {}
