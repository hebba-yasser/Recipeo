import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:recpie_app/core/errors/failure.dart';
import 'package:recpie_app/core/repos/shared_repos.dart';
import 'package:recpie_app/core/utils/cache_helper.dart';
import 'package:recpie_app/features/auth/data/repos/auth_repo.dart';

import '../../../../constants.dart';
import '../../../../core/data/models/user_model/user_model.dart';

class AuthRepoImp implements AuthRepo {
  final SharedRepos sharedRepos;

  AuthRepoImp(this.sharedRepos);

  @override
  Future<Either<Failure, UserModel>> register({
    required String email,
    required String password,
    required String name,
    required String phone,
  }) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (userCredential.user != null) {
        return await createUser(
            email: email,
            name: name,
            phone: phone,
            uId: userCredential.user!.uid);
      }
      return left(FirebaseFailure('User credential is null'));
    } on FirebaseAuthException catch (e) {
      return left(FirebaseFailure.fromFirebaseAuthException(e));
    } catch (e) {
      return left(FirebaseFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserModel>> createUser({
    required String email,
    required String uId,
    required String name,
    required String phone,
  }) async {
    try {
      UserModel newUser = UserModel(
        uId: uId,
        name: name,
        email: email,
        phone: phone,
        preferences: null,
        recentSearch: null,
        imgUrl: null,
        likedRecipes: null,
      );
      await FirebaseFirestore.instance
          .collection('users')
          .doc(uId)
          .set(newUser.toMap());
      await CacheHelper.setString(key: 'uid', value: uId);
      return right(newUser);
    } on FirebaseAuthException catch (e) {
      return left(FirebaseFailure.fromFirebaseAuthException(e));
    } catch (e) {
      return left(FirebaseFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserModel>> login({
    required String email,
    required String password,
  }) async {
    try {
      var userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      if (userCredential.user != null) {
        DocumentSnapshot userData = await FirebaseFirestore.instance
            .collection('users')
            .doc(userCredential.user!.uid)
            .get();
        if (userData.exists) {
          await CacheHelper.setString(
              key: 'uid', value: userCredential.user!.uid);
          await CacheHelper.setBoolean(key: 'islogged', value: true);
          uId = CacheHelper.getString(key: 'uid');
          isLogged = CacheHelper.getBoolean(key: 'islogged') ?? false;
          return Right(
              UserModel.fromMap(userData.data() as Map<String, dynamic>));
        }
      }
      return left(FirebaseFailure('User credential is null'));
    } catch (e) {
      if (e is FirebaseAuthException) {
        return left(FirebaseFailure.fromFirebaseAuthException(e));
      } else {
        return left(FirebaseFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, void>> logout() async {
    try {
      await FirebaseAuth.instance.signOut();
      await CacheHelper.removeData(key: 'uid');
      await CacheHelper.setBoolean(key: 'islogged', value: false);

      return right(null);
    } catch (e) {
      if (e is FirebaseAuthException) {
        return left(FirebaseFailure.fromFirebaseAuthException(e));
      } else {
        return left(FirebaseFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, void>> forgotPassword({required String email}) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      return right(null);
    } catch (e) {
      if (e is FirebaseAuthException) {
        return left(FirebaseFailure.fromFirebaseAuthException(e));
      } else {
        return left(FirebaseFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, void>> changePassword({
    required String currentPassword,
    required String newPassword,
  }) async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        AuthCredential credential = EmailAuthProvider.credential(
          email: user.email!,
          password: currentPassword,
        );

        await user.reauthenticateWithCredential(credential);

        await user.updatePassword(newPassword);

        return right(null);
      }
      return left(FirebaseFailure('No User Found'));
    } on FirebaseAuthException catch (e) {
      return left(FirebaseFailure.fromFirebaseAuthException(
          e)); // Handling Firebase errors
    } catch (e) {
      return left(FirebaseFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserModel>> updateUserPreferences({
    required UserModel user,
  }) async {
    var uId = CacheHelper.getString(key: 'uid');
    return await sharedRepos.updateUserPreferences(user: user, userId: uId!);
  }
}
