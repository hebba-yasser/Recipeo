import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:recpie_app/core/data/models/user_model/small_recipe_model.dart';

class CollectionModel {
  final String? collectionId;
  final String collectionName;
  final List<SmallRecipeModel>? recipes;
  final DateTime? createdAt; // New field

  CollectionModel({
    this.collectionId,
    required this.collectionName,
    this.recipes,
    this.createdAt,
  });

  factory CollectionModel.fromMap(Map<String, dynamic> data) {
    return CollectionModel(
      collectionId: data['collectionId'],
      collectionName: data['collectionName'],
      recipes: (data['recipes'] as List<dynamic>?)
          ?.map((e) => SmallRecipeModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      createdAt: data['createdAt'] != null
          ? (data['createdAt'] as Timestamp).toDate()
          : null,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'collectionId': collectionId,
      'collectionName': collectionName,
      'recipes': recipes?.map((e) => e.toJson()).toList(),
      'createdAt': createdAt != null
          ? Timestamp.fromDate(createdAt!)
          : null, // Convert DateTime to Firestore Timestamp
    };
  }
}
