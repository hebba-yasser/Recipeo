import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:recpie_app/features/profile/data/repos/profile_repos.dart';

import 'change_password_state.dart';

class ChangePasswordCubit extends Cubit<ChangePasswordState> {
  final ProfileRepos profileRepos;

  ChangePasswordCubit(this.profileRepos) : super(ChangePasswordInitial());

  Future<void> changePasswordFromProfile({
    required String currentPassword,
    required String newPassword,
  }) async {
    emit(ChangePasswordLoading());
    var result = await profileRepos.changePasswordFromProfile(
        currentPassword: currentPassword, newPassword: newPassword);
    result.fold((failure) {
      print(failure.errMessage);
      emit(ChangePasswordFailure(failure.errMessage));
    }, (r) {
      emit(ChangePasswordSuccess());
    });
  }

  bool isHidden1 = true;
  bool isHidden2 = true;
  bool isHidden3 = true;

  IconData suffixIcon1 = Icons.visibility_off;
  IconData suffixIcon2 = Icons.visibility_off;
  IconData suffixIcon3 = Icons.visibility_off;

  void togglePasswordVisibility(int fieldNumber) {
    if (fieldNumber == 1) {
      isHidden1 = !isHidden1;
      suffixIcon1 = isHidden1 ? Icons.visibility_off : Icons.visibility;
    } else if (fieldNumber == 2) {
      isHidden2 = !isHidden2;
      suffixIcon2 = isHidden2 ? Icons.visibility_off : Icons.visibility;
    } else if (fieldNumber == 3) {
      isHidden3 = !isHidden3;
      suffixIcon3 = isHidden3 ? Icons.visibility_off : Icons.visibility;
    }
    emit(TogglePasswordVisibility());
  }
}
