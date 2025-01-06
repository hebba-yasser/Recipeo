import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:recpie_app/core/data/models/user_model/user_model.dart';

import '../../../../core/errors/failure.dart';

abstract class ProfileRepos {
  Future<Either<Failure, void>> logoutFromProfile();

  Future<Either<Failure, void>> changePasswordFromProfile({
    required String currentPassword,
    required String newPassword,
  });

  Future<Either<Failure, UserModel>> updateUserData({required UserModel user});

  Future<Either<Failure, UserModel>> updateUserPreferences({
    required UserModel user,
  });

  Future<Either<Failure, UserModel>> updateUserImage(
      {required String imageUrl});
  Future<Either<SupabaseFailure, String>> uploadImageToSupabase(
      {required File imageFile});
}
