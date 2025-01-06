import 'package:equatable/equatable.dart';

class Us extends Equatable {
  final String? value;
  final String? unit;

  const Us({this.value, this.unit});

  factory Us.fromJson(Map<String, dynamic> json) => Us(
        value: json['value'].toString() as String?,
        unit: json['unit'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'value': value,
        'unit': unit,
      };

  @override
  List<Object?> get props => [value, unit];
}
