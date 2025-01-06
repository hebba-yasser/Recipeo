import 'package:equatable/equatable.dart';

class CaloricBreakdown extends Equatable {
  final String? percentProtein;
  final String? percentFat;
  final String? percentCarbs;

  const CaloricBreakdown({
    this.percentProtein,
    this.percentFat,
    this.percentCarbs,
  });

  factory CaloricBreakdown.fromJson(Map<String, dynamic> json) {
    return CaloricBreakdown(
      percentProtein: json['percentProtein'].round().toString() as String?,
      percentFat: json['percentFat'].round().toString() as String?,
      percentCarbs: json['percentCarbs'].round().toString() as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'percentProtein': percentProtein,
        'percentFat': percentFat,
        'percentCarbs': percentCarbs,
      };

  @override
  List<Object?> get props => [percentProtein, percentFat, percentCarbs];
}
