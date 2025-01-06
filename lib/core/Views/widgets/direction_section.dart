import 'package:flutter/cupertino.dart';
import 'package:recpie_app/core/styles/colors.dart';

import '../../../../../core/data/models/recipe_model/recipe_model.dart';
import '../../styles/fonts.dart';
import 'custom_divider.dart';
import 'direction_item.dart';

class DirectionSection extends StatelessWidget {
  const DirectionSection({
    super.key,
    required this.model,
  });

  final RecipeModel model;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
          padding: const EdgeInsets.all(12),
          height: 50,
          decoration: BoxDecoration(
              color: AppColors.lightPeach,
              borderRadius: BorderRadius.circular(10)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total Time:',
                style: AppFonts.bodyText16,
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                model.readyInMinutes ?? '',
                style:
                    AppFonts.bodyText16.copyWith(fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * .8,
          child: ListView.separated(
              itemBuilder: (context, index) => DirectionItem(
                    text:
                        model.analyzedInstructions?[0].steps?[index].step ?? '',
                    number: model.analyzedInstructions?[0].steps?[index].number
                            .toString() ??
                        '',
                  ),
              separatorBuilder: (context, index) => const CustomDivider(),
              itemCount: model.analyzedInstructions?[0].steps?.length ?? 0),
        ),
      ],
    );
  }
}
