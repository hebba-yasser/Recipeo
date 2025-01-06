import 'package:dartz/dartz.dart';
import 'package:recpie_app/core/errors/failure.dart';

import '../../../../core/data/models/user_model/user_model.dart';

abstract class AuthRepo {
  Future<Either<Failure, UserModel>> register({
    required String email,
    required String password,
    required String name,
    required String phone,
  });
  Future<Either<Failure, UserModel>> updateUserPreferences(
      {required UserModel user});
  Future<Either<Failure, UserModel>> createUser({
    required String email,
    required String uId,
    required String name,
    required String phone,
  });

  Future<Either<Failure, UserModel>> login({
    required String email,
    required String password,
  });

  Future<Either<Failure, void>> logout();

  Future<Either<Failure, void>> forgotPassword({required String email});

  Future<Either<Failure, void>> changePassword({
    required String currentPassword,
    required String newPassword,
  });
}
