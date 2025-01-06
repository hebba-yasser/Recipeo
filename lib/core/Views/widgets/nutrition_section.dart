import 'package:flutter/material.dart';

import '../../../../../core/data/models/recipe_model/recipe_model.dart';
import 'chart_section.dart';
import 'nutrition_info_section.dart';

class NutritionSection extends StatelessWidget {
  const NutritionSection({super.key, required this.model});
  final RecipeModel model;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
          child: ChartSection(
            model: model,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        NutritionInfoSection(
          model: model,
        ),
      ],
    );
  }
}
