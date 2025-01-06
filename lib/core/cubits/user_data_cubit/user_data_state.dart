import 'package:flutter/cupertino.dart';

import '../../../../../core/data/models/user_model/user_model.dart';

@immutable
sealed class UserDataState {}

final class UserDataInitial extends UserDataState {}

final class UserDataLoading extends UserDataState {}

final class UserDataSuccess extends UserDataState {
  final UserModel user;

  UserDataSuccess(this.user);
}

final class UserDataFailure extends UserDataState {
  final String errMessage;

  UserDataFailure(this.errMessage);
}
