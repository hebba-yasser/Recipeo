import 'package:equatable/equatable.dart';

class Preferences extends Equatable {
  final List<dynamic>? excludedIngredients;
  final List<dynamic>? allergies;
  final List<dynamic>? diets;
  final List<dynamic>? favouriteCuisines;

  const Preferences({
    this.excludedIngredients,
    this.allergies,
    this.diets,
    this.favouriteCuisines,
  });

  factory Preferences.fromJson(Map<String, dynamic> json) => Preferences(
        excludedIngredients: json['excludedIngredients'] as List<dynamic>?,
        allergies: json['allergies'] as List<dynamic>?,
        diets: json['diets'] as List<dynamic>?,
        favouriteCuisines: json['favouriteCuisines'] as List<dynamic>?,
      );

  Map<String, dynamic> toJson() => {
        'excludedIngredients': excludedIngredients,
        'allergies': allergies,
        'diets': diets,
        'favouriteCuisines': favouriteCuisines,
      };

  // Preferences copyWith({
  //   List<String>? excludedIngredients,
  //   List<String>? allergies,
  //   List<String>? diets,
  //   List<String>? favouriteCuisines,
  // }) {
  //   return Preferences(
  //     excludedIngredients: excludedIngredients ?? this.excludedIngredients,
  //     allergies: allergies ?? this.allergies,
  //     diets: diets ?? this.diets,
  //     favouriteCuisines: favouriteCuisines ?? this.favouriteCuisines,
  //   );
  // }

  @override
  List<Object?> get props {
    return [
      excludedIngredients,
      allergies,
      diets,
      favouriteCuisines,
    ];
  }
}
