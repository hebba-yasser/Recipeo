import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:recpie_app/core/styles/colors.dart';

import '../../../../../core/data/models/recipe_model/recipe_model.dart';
import '../../../constants.dart';

class PieChartCircle extends StatelessWidget {
  const PieChartCircle({
    super.key,
    required this.model,
  });
  final RecipeModel model;
  List<PieChartSectionData> getSections() {
    return [
      PieChartSectionData(
        title: ' ',
        color: const Color(0xFF3f5f89),
        value: double.tryParse(
                model.nutrition?.caloricBreakdown?.percentFat ?? '') ??
            0.0, // Value percentage
        radius: 50, // Radius of the section
      ),
      PieChartSectionData(
        color: AppColors.mintGreen,
        value: double.tryParse(
                model.nutrition?.caloricBreakdown?.percentCarbs ?? '') ??
            0.0,
        radius: 50,
        title: ' ',
      ),
      PieChartSectionData(
        color: kprimaryColor,
        value: double.tryParse(
                model.nutrition?.caloricBreakdown?.percentProtein ?? '') ??
            0.0,
        radius: 50,
        title: ' ',
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 120, // Adjust width of pie chart
      height: 100, // Adjust height of pie chart
      child: PieChart(
        PieChartData(
          sections: getSections(),
          centerSpaceRadius: 0,
          sectionsSpace: 0,
          startDegreeOffset: 0,
          borderData: FlBorderData(show: false), // Hide chart borders
        ),
      ),
    );
  }
}
