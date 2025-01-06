import 'package:flutter/material.dart';
import 'package:recpie_app/features/onboarding/data/models/onboarding_model.dart';

import 'curved_container.dart';
import 'onbording_text_item.dart';

class OnboardingItem extends StatelessWidget {
  const OnboardingItem({super.key, required this.model});
  final OnboardingModel model;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: CurvedContainer(
            image: model.imagePath,
            backgroundColor: model.backgroundColor,
            foregroundColor: model.foregroundColor,
          ),
        ),
        onboardingTextItem(model: model),
      ],
    );
  }
}
