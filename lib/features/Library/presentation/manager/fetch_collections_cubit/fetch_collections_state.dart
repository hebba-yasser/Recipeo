import 'package:flutter/cupertino.dart';
import 'package:recpie_app/core/data/models/user_model/collections_model.dart';

@immutable
sealed class FetchCollectionsState {}

final class FetchCollectionsInitial extends FetchCollectionsState {}

final class FetchCollectionsLoading extends FetchCollectionsState {}

final class FetchCollectionsSuccess extends FetchCollectionsState {
  final List<CollectionModel> collectionList;
  FetchCollectionsSuccess(this.collectionList);
}

final class FetchCollectionsFailure extends FetchCollectionsState {
  final String errMessage;

  FetchCollectionsFailure(this.errMessage);
}
