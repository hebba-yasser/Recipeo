import 'package:bloc/bloc.dart';

import '../../../../../core/data/models/user_model/collections_model.dart';
import '../../../data/repos/Library_repos.dart';
import 'fetch_collections_state.dart';

class FetchCollectionsCubit extends Cubit<FetchCollectionsState> {
  final LibraryRepos libraryRepos;

  FetchCollectionsCubit(
    this.libraryRepos,
  ) : super(FetchCollectionsInitial());
  List<CollectionModel> collectionList = [];
  void fetchCollections({required String id}) {
    emit(FetchCollectionsLoading());
    libraryRepos
        .fetchCollections(
      id: id,
    )
        .listen((result) {
      result.fold(
        (failure) {
          emit(FetchCollectionsFailure(failure.errMessage));
        },
        (collections) {
          collectionList = collections;
          emit(FetchCollectionsSuccess(collections));
        },
      );
    });
  }
}