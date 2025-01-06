import 'package:equatable/equatable.dart';

class Metric extends Equatable {
  final String? value;
  final String? unit;

  const Metric({this.value, this.unit});

  factory Metric.fromJson(Map<String, dynamic> json) => Metric(
        value: json['value'].round().toString() as String?,
        unit: json['unit'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'value': value,
        'unit': unit,
      };

  @override
  List<Object?> get props => [value, unit];
}
