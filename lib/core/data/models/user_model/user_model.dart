import 'package:equatable/equatable.dart';
import 'package:recpie_app/core/data/models/user_model/preferences.dart';
import 'package:recpie_app/core/data/models/user_model/small_recipe_model.dart';

class UserModel extends Equatable {
  final String? uId;
  final String? name;
  final String? email;
  final String? phone;
  final String? imgUrl;
  final Preferences? preferences;
  final List<dynamic>? recentSearch;
  final List<SmallRecipeModel>? likedRecipes;

  const UserModel({
    this.uId,
    this.name,
    this.email,
    this.phone,
    this.imgUrl,
    this.preferences,
    this.recentSearch,
    this.likedRecipes,
  });

  factory UserModel.fromMap(Map<String, dynamic> data) {
    return UserModel(
      uId: data['uId'] ?? '',
      name: data['name'] ?? '',
      email: data['email'] ?? '',
      phone: data['phone'] ?? '',
      imgUrl: data['imgUrl'] ?? '',
      preferences: data['preferences'] == null
          ? null
          : Preferences.fromJson(data['preferences'] as Map<String, dynamic>),
      recentSearch: data['recentSearch'] as List<dynamic>? ?? [],
      likedRecipes: (data['likedRecipes'] as List<dynamic>?)
          ?.map((e) => SmallRecipeModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uId': uId,
      'name': name,
      'email': email,
      'phone': phone,
      'imgUrl': imgUrl,
      'preferences': preferences?.toJson(),
      'recentSearch': recentSearch,
      'likedRecipes': likedRecipes?.map((e) => e.toJson()).toList(),
    };
  }

  @override
  List<Object?> get props {
    return [
      uId,
      name,
      email,
      phone,
      imgUrl,
      preferences,
      recentSearch,
      likedRecipes,
    ];
  }
}
