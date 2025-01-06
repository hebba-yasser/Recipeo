import 'package:flutter/cupertino.dart';
import 'package:recpie_app/core/Views/widgets/pie_chart_circle.dart';
import 'package:recpie_app/core/Views/widgets/pie_chart_info_content.dart';

import '../../../../../core/data/models/recipe_model/recipe_model.dart';
import '../../styles/colors.dart';

class ChartSection extends StatelessWidget {
  const ChartSection({
    super.key,
    required this.model,
  });
  final RecipeModel model;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .2,
      width: MediaQuery.of(context).size.height * .45,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15), color: AppColors.cream),
      child: Row(
        children: [
          PieChartCircle(
            model: model,
          ),
          Expanded(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
              child: PieChartInfoContent(
                model: model,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
