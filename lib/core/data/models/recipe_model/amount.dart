import 'package:equatable/equatable.dart';

import 'metric.dart';
import 'us.dart';

class Amount extends Equatable {
  final Metric? metric;
  final Us? us;

  const Amount({this.metric, this.us});

  factory Amount.fromJson(Map<String, dynamic> json) => Amount(
        metric: json['metric'] == null
            ? null
            : Metric.fromJson(json['metric'] as Map<String, dynamic>),
        us: json['us'] == null
            ? null
            : Us.fromJson(json['us'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'metric': metric?.toJson(),
        'us': us?.toJson(),
      };

  @override
  List<Object?> get props => [metric, us];
}
