import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:recpie_app/core/data/models/recipe_model/recipe_model.dart';
import 'package:recpie_app/core/data/models/user_model/collections_model.dart';
import 'package:recpie_app/core/errors/failure.dart';
import 'package:recpie_app/features/Library/data/repos/Library_repos.dart';

import '../../../../constants.dart';
import '../../../../core/data/models/user_model/small_recipe_model.dart';
import '../../../../core/repos/shared_repos.dart';

class LibraryReposImp implements LibraryRepos {
  final SharedRepos sharedRepos;

  LibraryReposImp(this.sharedRepos);

  @override
  Future<Either<Failure, RecipeModel>> fetchRecipeById(
      {required int id}) async {
    return await sharedRepos.fetchRecipeById(id: id);
  }

  @override
  Future<Either<Failure, void>> addCollection(
      {required CollectionModel collection}) async {
    try {
      final docRef = await FirebaseFirestore.instance
          .collection('users')
          .doc(uId)
          .collection('collections')
          .add({
        ...collection.toMap(),
        'createdAt': FieldValue.serverTimestamp()
      });
      final collectionId = docRef.id;
      await docRef.update({'collectionId': collectionId});
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
  Future<Either<Failure, void>> updateCollection(
      {required CollectionModel collection}) async {
    try {
      final collectionDoc = FirebaseFirestore.instance
          .collection('users')
          .doc(uId)
          .collection('collections')
          .doc(collection.collectionId);
      await collectionDoc.update(collection.toMap());
      return const Right(null);
    } catch (e) {
      if (e is FirebaseAuthException) {
        return left(FirebaseFailure.fromFirebaseAuthException(e));
      } else {
        return left(FirebaseFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, void>> deleteCollection(
      {required CollectionModel collection}) async {
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(uId)
          .collection('collections')
          .doc(collection.collectionId)
          .delete();
      return const Right(null);
    } catch (e) {
      if (e is FirebaseAuthException) {
        return left(FirebaseFailure.fromFirebaseAuthException(e));
      } else {
        return left(FirebaseFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, void>> removeRecipesFromCollection({
    required String collectionId,
    required List<SmallRecipeModel> recipesList,
  }) async {
    try {
      final collectionDoc = FirebaseFirestore.instance
          .collection('users')
          .doc(uId)
          .collection('collections')
          .doc(collectionId);

      await collectionDoc.update({
        'recipes': FieldValue.arrayRemove(
          recipesList.map((recipe) => recipe.toJson()).toList(),
        ),
      });

      return const Right(null);
    } catch (e) {
      if (e is FirebaseAuthException) {
        return left(FirebaseFailure.fromFirebaseAuthException(e));
      } else {
        return left(FirebaseFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, void>> moveRecipe({
    required String removeCollectionId,
    required String newCollectionId,
    required List<SmallRecipeModel> recipesList,
  }) async {
    try {
      await removeRecipesFromCollection(
          collectionId: removeCollectionId, recipesList: recipesList);
      final collectionDoc = FirebaseFirestore.instance
          .collection('users')
          .doc(uId)
          .collection('collections')
          .doc(newCollectionId);
      await collectionDoc.update({
        'recipes': FieldValue.arrayUnion(
          recipesList.map((recipe) => recipe.toJson()).toList(),
        ),
      });
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
  Stream<Either<Failure, CollectionModel>> fetchRecipesOfCollection(
      {required String collectionId}) async* {
    try {
      final collectionStream = FirebaseFirestore.instance
          .collection('users')
          .doc(uId)
          .collection('collections')
          .doc(collectionId)
          .snapshots();
      if (await collectionStream.isEmpty) {
        yield Left(FirebaseFailure('There is no data available'));
      } else {
        await for (final snapshot in collectionStream) {
          yield Right(CollectionModel.fromMap(snapshot.data()!));
        }
      }
    } catch (e) {
      if (e is FirebaseAuthException) {
        yield Left(FirebaseFailure.fromFirebaseAuthException(
            e.toString() as FirebaseAuthException));
      } else {
        yield Left(FirebaseFailure(e.toString()));
      }
    }
  }

  Future<Either<Failure, List<CollectionModel>>> fetchCollections({
    required id,
  }) async {
    try {
      final collectionDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(id)
          .collection('collections')
          .get();
      if (collectionDoc.docs.isNotEmpty) {
        List<CollectionModel> collections = [];
        for (var collection in collectionDoc.docs) {
          collections.add(CollectionModel.fromMap(collection.data()));
        }
        return Right(collections);
      } else {
        return Right([]);
      }
    } catch (e) {
      if (e is FirebaseAuthException) {
        return left(FirebaseFailure.fromFirebaseAuthException(e));
      } else {
        return left(FirebaseFailure(e.toString()));
      }
    }
  }
}
