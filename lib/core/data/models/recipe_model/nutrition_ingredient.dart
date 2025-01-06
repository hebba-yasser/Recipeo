import 'package:equatable/equatable.dart';

import 'nutrient.dart';

class NutritionIngredient extends Equatable {
  final int? id;
  final String? name;
  final String? amount;
  final String? unit;
  final List<Nutrient>? nutrients;

  const NutritionIngredient({
    this.id,
    this.name,
    this.amount,
    this.unit,
    this.nutrients,
  });

  factory NutritionIngredient.fromJson(Map<String, dynamic> json) =>
      NutritionIngredient(
        id: json['id'] as int?,
        name: json['name'] as String?,
        amount:
            json['amount'] != null ? json['amount'].toString() as String? : '',
        unit: json['unit'] as String?,
        nutrients: (json['nutrients'] as List<dynamic>?)
            ?.map((e) => Nutrient.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'amount': amount,
        'unit': unit,
        'nutrients': nutrients?.map((e) => e.toJson()).toList(),
      };

  @override
  List<Object?> get props => [id, name, amount, unit, nutrients];
}
