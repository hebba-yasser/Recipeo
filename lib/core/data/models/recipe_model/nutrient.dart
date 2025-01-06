import 'package:equatable/equatable.dart';

class Nutrient extends Equatable {
  final String? name;
  final String? amount;
  final String? unit;
  final String? percentOfDailyNeeds;

  const Nutrient({
    this.name,
    this.amount,
    this.unit,
    this.percentOfDailyNeeds,
  });

  factory Nutrient.fromJson(Map<String, dynamic> json) => Nutrient(
        name: json['name'] as String?,
        amount: json['amount'].toStringAsFixed(2) as String?,
        unit: json['unit'] as String?,
        percentOfDailyNeeds:
            (json['percentOfDailyNeeds'].round()).toString() as String?,
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'amount': amount,
        'unit': unit,
        'percentOfDailyNeeds': percentOfDailyNeeds,
      };

  @override
  List<Object?> get props => [name, amount, unit, percentOfDailyNeeds];
}
