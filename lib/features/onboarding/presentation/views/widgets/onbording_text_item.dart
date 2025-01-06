import 'package:flutter/material.dart';

import '../../../../../constants.dart';
import '../../../../../core/styles/fonts.dart';
import '../../../data/models/onboarding_model.dart';

class onboardingTextItem extends StatelessWidget {
  const onboardingTextItem({
    super.key,
    required this.model,
  });

  final OnboardingModel model;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
      child: Column(
        children: [
          Text(
            model.title,
            style: AppFonts.accentHeading.copyWith(color: kprimaryColor),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            model.subtitle,
            style: AppFonts.accentBody18,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
