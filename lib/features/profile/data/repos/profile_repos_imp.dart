import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:recpie_app/core/data/models/user_model/user_model.dart';
import 'package:recpie_app/core/repos/shared_repos.dart';
import 'package:recpie_app/features/auth/data/repos/auth_repo.dart';
import 'package:recpie_app/features/profile/data/repos/profile_repos.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../constants.dart';
import '../../../../core/errors/failure.dart';

class ProfileReposImp implements ProfileRepos {
  final AuthRepo authRepo;
  final SharedRepos sharedRepos;

  ProfileReposImp(
    this.authRepo,
    this.sharedRepos,
  );

  @override
  Future<Either<Failure, void>> logoutFromProfile() async {
    return await authRepo.logout();
  }

  @override
  Future<Either<Failure, void>> changePasswordFromProfile({
    required String currentPassword,
    required String newPassword,
  }) async {
    return await authRepo.changePassword(
        currentPassword: currentPassword, newPassword: newPassword);
  }

  @override
  Future<Either<Failure, UserModel>> updateUserData(
      {required UserModel user}) async {
    try {
      final userDoc = FirebaseFirestore.instance.collection('users').doc(uId);
      await userDoc.update(user.toMap());
      final updatedData = await userDoc.get();
      final updatedUser = UserModel.fromMap(updatedData.data()!);
      return Right(updatedUser);
    } catch (e) {
      if (e is FirebaseAuthException) {
        return left(FirebaseFailure.fromFirebaseAuthException(e));
      } else {
        return left(FirebaseFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<SupabaseFailure, String>> uploadImageToSupabase(
      {required File imageFile}) async {
    try {
      final fileName = '${DateTime.now().millisecondsSinceEpoch}.jpg';

      final response = await Supabase.instance.client.storage
          .from('user_images')
          .upload(fileName, imageFile);
      if (response.isNotEmpty) {
        final publicUrl = Supabase.instance.client.storage
            .from('user_images')
            .getPublicUrl(fileName); // Use only the fileName here
        return Right(publicUrl);
      } else {
        return Left(SupabaseFailure('Error uploading image.'));
      }
    } catch (e) {
      return Left(SupabaseFailure('Error uploading image: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, UserModel>> updateUserImage(
      {required String imageUrl}) async {
    try {
      final userDoc = FirebaseFirestore.instance.collection('users').doc(uId);
      await userDoc.update({'imgUrl': imageUrl});
      final updatedData = await userDoc.get();
      final updatedUser = UserModel.fromMap(updatedData.data()!);
      return Right(updatedUser);
    } catch (e) {
      if (e is FirebaseAuthException) {
        return left(FirebaseFailure.fromFirebaseAuthException(e));
      } else {
        return left(FirebaseFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, UserModel>> updateUserPreferences({
    required UserModel user,
  }) async {
    return await sharedRepos.updateUserPreferences(user: user, userId: uId!);
  }
}
