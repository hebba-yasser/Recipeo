import 'package:flutter/material.dart';

import '../../styles/fonts.dart';

class RatingContainer extends StatelessWidget {
  const RatingContainer({
    super.key,
    required this.model,
  });
  final model;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.star_rate_rounded,
            color: Colors.amber,
          ),
          const SizedBox(
            width: 5,
          ),
          Text(
            model.spoonacularScore ?? ' ',
            style: AppFonts.bodyText14.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          const Icon(
            Icons.favorite,
            color: Colors.red,
            size: 20,
          ),
          const SizedBox(
            width: 5,
          ),
          Text(
            model.aggregateLikes ?? '',
            style: AppFonts.bodyText14.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
