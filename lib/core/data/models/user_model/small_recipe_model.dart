import 'package:equatable/equatable.dart';

class SmallRecipeModel extends Equatable {
  final String? aggregateLikes;
  final int? id;
  final String? title;
  final String? image;
  final String? spoonacularScore;

  const SmallRecipeModel({
    this.aggregateLikes,
    this.id,
    this.title,
    this.image,
    this.spoonacularScore,
  });

  factory SmallRecipeModel.fromJson(Map<String, dynamic> json) {
    return SmallRecipeModel(
      id: json['id'] as int?,
      title: json['title'] as String?,
      image: json['image'] as String?,
      spoonacularScore: json['spoonacularScore'],
      aggregateLikes: json['aggregateLikes']?.toString(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'aggregateLikes': aggregateLikes,
      'id': id,
      'title': title,
      'image': image,
      'spoonacularScore': spoonacularScore,
    };
  }

  @override
  List<Object?> get props {
    return [
      aggregateLikes,
      id,
      title,
      image,
      spoonacularScore,
    ];
  }
}
