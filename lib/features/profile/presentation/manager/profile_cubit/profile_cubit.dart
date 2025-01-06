import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:recpie_app/features/profile/data/repos/profile_repos.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ProfileRepos profileRepos;

  ProfileCubit(this.profileRepos) : super(ProfileInitial());

  Future<void> logOutFromProfile() async {
    emit(ProfileLogOutLoading());
    var result = await profileRepos.logoutFromProfile();
    result.fold((failure) {
      emit(ProfileLogOutFailure(failure.errMessage));
    }, (r) {
      emit(ProfileLogOutSuccess());
    });
  }
}
