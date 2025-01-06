import 'package:flutter/material.dart';

import '../../../../../core/data/models/recipe_model/recipe_model.dart';
import '../../../constants.dart';
import '../../styles/fonts.dart';

class RecipeInfoContainer extends StatelessWidget {
  const RecipeInfoContainer({
    super.key,
    required this.model,
  });
  final RecipeModel model;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 9),
      //  height: MediaQuery.of(context).size.height * .09,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            model.title ?? ' ',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: AppFonts.bodyText18,
          ),
          Row(
            children: [
              const Icon(
                Icons.timer,
                color: kprimaryColor,
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                '${model.readyInMinutes} Mins... ',
                style: AppFonts.bodyText14,
              ),
              Text(
                model.difficultyLevel ?? '',
                style: AppFonts.bodyText14,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
