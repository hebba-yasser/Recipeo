import 'package:flutter/material.dart';

import '../../../../../core/data/models/recipe_model/recipe_model.dart';
import '../../../../../core/styles/fonts.dart';
import 'custom_divider.dart';
import 'nutrition_item.dart';

class NutritionInfoSection extends StatelessWidget {
  const NutritionInfoSection({
    super.key,
    required this.model,
  });
  final RecipeModel model;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NutritionItem(
          rda: 'RDA',
          text: 'PER SERVING',
          amount: 'AMOUNT',
          style: AppFonts.bodyText14.copyWith(fontWeight: FontWeight.w500),
        ),
        const CustomDivider(),
        NutritionItem(
          text: 'Calories',
          amount: model.nutrition?.getAmountUnit('calories') ?? '',
          rda: model.nutrition?.getAmountUnit('calories') != ''
              ? '${model.nutrition?.getRDA('calories')}%'
              : '',
        ),
        const CustomDivider(),
        NutritionItem(
          text: 'Total Fat',
          amount: model.nutrition?.getAmountUnit('fat') ?? '',
          rda: model.nutrition?.getAmountUnit('fat') != ''
              ? '${model.nutrition?.getRDA('fat')}%'
              : '',
        ),
        NutritionItem(
          text: 'Saturated Fat',
          amount: model.nutrition?.getAmountUnit('saturated fat') ?? '',
          rda: model.nutrition?.getAmountUnit('saturated fat') != ''
              ? '${model.nutrition?.getRDA('saturated fat')}%'
              : '',
          style: AppFonts.bodyText14
              .copyWith(color: Colors.black87.withOpacity(.65)),
          alignText: 15,
        ),
        NutritionItem(
          text: 'Trans Fat',
          amount: '',
          rda: '',
          style: AppFonts.bodyText14
              .copyWith(color: Colors.black87.withOpacity(.65)),
          alignText: 15,
        ),
        const CustomDivider(),
        NutritionItem(
          text: 'Cholesterol',
          amount: model.nutrition?.getAmountUnit('cholesterol') ?? '',
          rda: model.nutrition?.getAmountUnit('cholesterol') != ''
              ? '${model.nutrition?.getRDA('cholesterol')}%'
              : '',
        ),
        const CustomDivider(),
        NutritionItem(
          text: 'Sodium',
          amount: model.nutrition?.getAmountUnit('sodium') ?? '',
          rda: model.nutrition?.getAmountUnit('sodium') != ''
              ? '${model.nutrition?.getRDA('sodium')}%'
              : '',
        ),
        const CustomDivider(),
        NutritionItem(
          text: 'Potassium',
          amount: model.nutrition?.getAmountUnit('potassium') ?? '',
          rda: model.nutrition?.getAmountUnit('potassium') != ''
              ? '${model.nutrition?.getRDA('potassium')}%'
              : '',
        ),
        const CustomDivider(),
        NutritionItem(
          text: 'Net Carbs',
          amount: model.nutrition?.getAmountUnit('net carbohydrates') ?? '',
          rda: model.nutrition?.getAmountUnit('net carbohydrates') != ''
              ? '${model.nutrition?.getRDA('net carbohydrates')}%'
              : '',
        ),
        const CustomDivider(),
        NutritionItem(
          text: 'Total Carbs',
          amount: model.nutrition?.getAmountUnit('carbohydrates') ?? '',
          rda: model.nutrition?.getAmountUnit('carbohydrates') != ''
              ? '${model.nutrition?.getRDA('carbohydrates')}%'
              : '',
        ),
        NutritionItem(
          text: 'Sugars',
          amount: model.nutrition?.getAmountUnit('sugar') ?? '',
          rda: model.nutrition?.getAmountUnit('sugar') != ''
              ? '${model.nutrition?.getRDA('sugar')}%'
              : '',
          style: AppFonts.bodyText14
              .copyWith(color: Colors.black87.withOpacity(.65)),
          alignText: 15,
        ),
        NutritionItem(
          text: 'Fiber',
          amount: model.nutrition?.getAmountUnit('fiber') ?? '',
          rda: model.nutrition?.getAmountUnit('fiber') != ''
              ? '${model.nutrition?.getRDA('fiber')}%'
              : '',
          style: AppFonts.bodyText14
              .copyWith(color: Colors.black87.withOpacity(.65)),
          alignText: 15,
        ),
        const CustomDivider(),
        NutritionItem(
          text: 'Protein',
          amount: model.nutrition?.getAmountUnit('protein') ?? '',
          rda: model.nutrition?.getAmountUnit('protein') != ''
              ? '${model.nutrition?.getRDA('protein')}%'
              : '',
        ),
        const CustomDivider(),
        NutritionItem(
          text: 'Calcium',
          amount: model.nutrition?.getAmountUnit('calcium') ?? '',
          rda: model.nutrition?.getAmountUnit('calcium') != ''
              ? '${model.nutrition?.getRDA('calcium')}%'
              : '',
        ),
        const CustomDivider(),
        NutritionItem(
          text: 'Iron',
          amount: model.nutrition?.getAmountUnit('iron') ?? '',
          rda: model.nutrition?.getAmountUnit('iron') != ''
              ? '${model.nutrition?.getRDA('iron')}%'
              : '',
        ),
        const CustomDivider(),
        NutritionItem(
          text: 'Zinc',
          amount: model.nutrition?.getAmountUnit('zinc') ?? '',
          rda: model.nutrition?.getAmountUnit('zinc') != ''
              ? '${model.nutrition?.getRDA('zinc')}%'
              : '',
        ),
        const CustomDivider(),
        NutritionItem(
          text: 'Vitamin A',
          amount: model.nutrition?.getAmountUnit('vitamin a') ?? '',
          rda: model.nutrition?.getAmountUnit('Vitamin a') != ''
              ? '${model.nutrition?.getRDA('Vitamin a')}%'
              : '',
        ),
        const CustomDivider(),
        NutritionItem(
          text: 'Vitamin C',
          amount: model.nutrition?.getAmountUnit('Vitamin C') ?? '',
          rda: model.nutrition?.getAmountUnit('Vitamin c') != ''
              ? '${model.nutrition?.getRDA('Vitamin c')}%'
              : '',
        ),
        const CustomDivider(),
        NutritionItem(
          text: 'Vitamin K',
          amount: model.nutrition?.getAmountUnit('Vitamin k') ?? '',
          rda: model.nutrition?.getAmountUnit('Vitamin k') != ''
              ? '${model.nutrition?.getRDA('Vitamin K')}%'
              : '',
        ),
        const CustomDivider(),
        NutritionItem(
          text: 'Vitamin E',
          amount: model.nutrition?.getAmountUnit('Vitamin E') ?? '',
          rda: model.nutrition?.getAmountUnit('Vitamin e') != ''
              ? '${model.nutrition?.getRDA('Vitamin e')}%'
              : '',
        ),
        const CustomDivider(),
      ],
    );
  }
}
