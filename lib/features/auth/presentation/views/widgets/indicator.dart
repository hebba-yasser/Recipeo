import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../../../../constants.dart';

class Indicator extends StatelessWidget {
  const Indicator({
    super.key,
    required this.footer,
    required this.center,
    required this.percent,
  });
  final String footer;
  final String center;
  final double percent;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 150,
      left: 0,
      right: 0,
      child: CircularPercentIndicator(
        radius: 45.0,
        lineWidth: 7.0,
        percent: percent,
        progressColor: kprimaryColor,
        circularStrokeCap: CircularStrokeCap.round,
        animation: true,
        center: Text(
          center,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.normal,
            color: Colors.black87,
          ),
        ),
        footer: Text(
          footer,
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
