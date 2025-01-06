import 'package:flutter/cupertino.dart';
import 'package:recpie_app/core/Views/widgets/pie_chart_content_item.dart';

import '../../../../../constants.dart';
import '../../../../../core/data/models/recipe_model/recipe_model.dart';
import 'custom_divider.dart';

class PieChartInfoContent extends StatelessWidget {
  const PieChartInfoContent({
    super.key,
    required this.model,
  });

  final RecipeModel model;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min, // Align text to start
      children: [
        PieChartContentItem(
          color: kprimaryColor,
          text: 'Protein',
          percentage:
              ' ${model.nutrition?.caloricBreakdown?.percentProtein}%'  ,
        ),
        CustomDivider(),
        PieChartContentItem(
          color: Color(0xFFA1D0C8),
          text: 'Carbs',
          percentage:
              ' ${model.nutrition?.caloricBreakdown?.percentCarbs}%'  ,
        ),
        CustomDivider(),
        PieChartContentItem(
          color: Color(0xFF3f5f89),
          text: 'Fat',
          percentage:
              ' ${model.nutrition?.caloricBreakdown?.percentFat}%'  ,
        ),
      ],
    );
  }
}
