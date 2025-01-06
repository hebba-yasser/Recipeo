import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recpie_app/core/data/models/user_model/user_model.dart';

import '../../../data/repos/auth_repo.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(
    this.authRepo,
  ) : super(AuthInitial());
  final AuthRepo authRepo;
  Future<void> register(
      {required String name,
      required String email,
      required String password,
      required String phone}) async {
    emit(AuthRegisterLoading());
    var result = await authRepo.register(
        email: email, password: password, name: name, phone: phone);
    result.fold(((failure) {
      emit(AuthRegisterFailure(errMess: failure.errMessage));
    }), ((success) {
      emit(AuthRegisterSuccess());
    }));
  }

  Future<void> login({
    required String email,
    required String password,
  }) async {
    emit(AuthLoginLoading());
    var result = await authRepo.login(
      email: email,
      password: password,
    );
    result.fold(((failure) {
      emit(AuthLoginFailure(errMess: failure.errMessage));
    }), ((user) {
      emit(AuthLoginSuccess(user));
    }));
  }

  Future<void> logout() async {
    emit(AuthLogoutLoading());
    var result = await authRepo.logout();
    result.fold(
      (failure) {
        emit(AuthLogoutFailure(errMess: failure.errMessage));
      },
      (r) {
        emit(AuthLogoutSuccess());
      },
    );
  }

  Future<void> forgotPassword({required String email}) async {
    emit(AuthResetPasswordLoading());
    var result = await authRepo.forgotPassword(email: email);
    result.fold(
      (failure) {
        emit(AuthResetPasswordFailure(errMess: failure.errMessage));
      },
      (r) {
        emit(AuthResetPasswordSuccess());
      },
    );
  }

  Future<void> changePassword({
    required String email,
    required String currentPassword,
    required String newPassword,
  }) async {
    emit(AuthResetPasswordLoading());
    var result = await authRepo.changePassword(
        newPassword: newPassword, currentPassword: currentPassword);
    result.fold(
      (failure) {
        emit(AuthResetPasswordFailure(errMess: failure.errMessage));
      },
      (r) {
        emit(AuthResetPasswordSuccess());
      },
    );
  }

  bool isHidden = true;
  IconData suffixIcon = Icons.visibility_off;

  void togglePasswordVisibility() {
    isHidden = !isHidden;
    suffixIcon = isHidden ? Icons.visibility_off : Icons.visibility;
    emit(AuthTogglePasswordVisibility());
  }
}
