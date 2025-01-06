import 'package:equatable/equatable.dart';

import 'caloric_breakdown.dart';
import 'flavonoid.dart';
import 'nutrient.dart';
import 'nutrition_ingredient.dart';
import 'property.dart';
import 'weight_per_serving.dart';

class Nutrition extends Equatable {
  final List<Nutrient>? nutrients;
  final List<Property>? properties;
  final List<Flavonoid>? flavonoids;
  final List<NutritionIngredient>? ingredients;
  final CaloricBreakdown? caloricBreakdown;
  final WeightPerServing? weightPerServing;

  const Nutrition({
    this.nutrients,
    this.properties,
    this.flavonoids,
    this.ingredients,
    this.caloricBreakdown,
    this.weightPerServing,
  });

  factory Nutrition.fromJson(Map<String, dynamic> json) => Nutrition(
        nutrients: (json['nutrients'] as List<dynamic>?)
            ?.map((e) => Nutrient.fromJson(e as Map<String, dynamic>))
            .toList(),
        properties: (json['properties'] as List<dynamic>?)
            ?.map((e) => Property.fromJson(e as Map<String, dynamic>))
            .toList(),
        flavonoids: (json['flavonoids'] as List<dynamic>?)
            ?.map((e) => Flavonoid.fromJson(e as Map<String, dynamic>))
            .toList(),
        ingredients: (json['ingredients'] as List<dynamic>?)
            ?.map(
                (e) => NutritionIngredient.fromJson(e as Map<String, dynamic>))
            .toList(),
        caloricBreakdown: json['caloricBreakdown'] == null
            ? null
            : CaloricBreakdown.fromJson(
                json['caloricBreakdown'] as Map<String, dynamic>),
        weightPerServing: json['weightPerServing'] == null
            ? null
            : WeightPerServing.fromJson(
                json['weightPerServing'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'nutrients': nutrients?.map((e) => e.toJson()).toList(),
        'properties': properties?.map((e) => e.toJson()).toList(),
        'flavonoids': flavonoids?.map((e) => e.toJson()).toList(),
        'ingredients': ingredients?.map((e) => e.toJson()).toList(),
        'caloricBreakdown': caloricBreakdown?.toJson(),
        'weightPerServing': weightPerServing?.toJson(),
      };

  @override
  List<Object?> get props {
    return [
      nutrients,
      properties,
      flavonoids,
      ingredients,
      caloricBreakdown,
      weightPerServing,
    ];
  }

  String getAmount(String name) {
    final specificNutrient = nutrients?.firstWhere(
      (nutrient) => nutrient.name?.toLowerCase() == name.toLowerCase(),
      orElse: () => const Nutrient(
          name: '', amount: '', unit: '', percentOfDailyNeeds: ''),
    );
    return specificNutrient?.amount ?? '';
  }

  String? getAmountUnit(String name) {
    final specificNutrient = nutrients?.firstWhere(
      (nutrient) => nutrient.name?.toLowerCase() == name.toLowerCase(),
      orElse: () => const Nutrient(
          name: '', amount: '', unit: '', percentOfDailyNeeds: ''),
    );

    return (specificNutrient?.amount != null &&
                specificNutrient!.amount != '' ||
            specificNutrient?.unit != null && specificNutrient?.unit != '')
        ? '${specificNutrient?.amount ?? ''} ${specificNutrient?.unit ?? ''}'
        : '';
  }

  String getRDA(String name) {
    final specificNutrient = nutrients?.firstWhere(
      (nutrient) => nutrient.name?.toLowerCase() == name.toLowerCase(),
      orElse: () => const Nutrient(
          name: '',
          amount: '',
          unit: '',
          percentOfDailyNeeds: ''), // Default nutrient
    );
    return (specificNutrient?.percentOfDailyNeeds != null &&
            specificNutrient!.percentOfDailyNeeds != '')
        ? specificNutrient.percentOfDailyNeeds!
        : '';
  }
}
