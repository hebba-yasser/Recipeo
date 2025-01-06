import 'package:equatable/equatable.dart';

import 'amount.dart';

class SpecificIngredients extends Equatable {
  final String? name;
  final String? image;
  final Amount? amount;

  const SpecificIngredients({this.name, this.image, this.amount});

  factory SpecificIngredients.fromJson(Map<String, dynamic> json) => SpecificIngredients(
        name: json['name'] as String?,
        image: json['image'] as String?,
        amount: json['amount'] == null
            ? null
            : Amount.fromJson(json['amount'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'image': image,
        'amount': amount?.toJson(),
      };

  @override
  List<Object?> get props => [name, image, amount];
}
