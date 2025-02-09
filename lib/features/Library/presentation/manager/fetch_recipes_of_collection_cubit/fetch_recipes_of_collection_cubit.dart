import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:recpie_app/features/Library/data/repos/Library_repos.dart';

import 'fetch_recipes_of_collection_state.dart';

class FetchRecipesOfCollectionCubit
    extends Cubit<FetchRecipesOfCollectionState> {
  FetchRecipesOfCollectionCubit(this.libraryRepos)
      : super(FetchRecipesOfCollectionInitial());
  final LibraryRepos libraryRepos;
  StreamSubscription? _subscription;
  Future<void> fetchRecipesOfCollection({
    required String collectionId,
  }) async {
    emit(FetchRecipesOfCollectionLoading());
    _subscription?.cancel();
    _subscription = libraryRepos
        .fetchRecipesOfCollection(collectionId: collectionId)
        .listen((result) {
      result.fold(
        (failure) => emit(FetchRecipesOfCollectionFailure(failure.errMessage)),
        (collection) {
          emit(FetchRecipesOfCollectionSuccess(collection));
        },
      );
    }, onError: (error) {
      emit(FetchRecipesOfCollectionFailure(error.toString()));
    });
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}
