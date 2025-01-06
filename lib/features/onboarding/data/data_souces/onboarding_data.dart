import 'package:flutter/material.dart';
import 'package:recpie_app/core/utils/assets.dart';
import 'package:recpie_app/features/onboarding/data/models/onboarding_model.dart';

import '../../../../constants.dart';

final List<OnboardingModel> onboardingData = [
  OnboardingModel(
    backgroundColor: Colors.white,
    foregroundColor: kprimaryColor,
    imagePath: AppAssets.food,
    title: 'Explore a World of Culinary Delights',
    subtitle:
        'Discover mouthwatering recipes,cooking tips and personalized recommendation',
  ),
  OnboardingModel(
      backgroundColor: Colors.white,
      foregroundColor: kprimaryColor,
      imagePath: AppAssets.search,
      title: 'Find Your Perfect Recipe in Seconds',
      subtitle:
          'Enter your ingredients or dietary needs to receive curated list of options in seconds'),
  OnboardingModel(
      foregroundColor: Colors.white,
      backgroundColor: kprimaryColor,
      imagePath: AppAssets.cooking,
      title: 'Tailored To Your Tastes',
      subtitle:
          'Customize your recipe preferences to receive curated collection suited to your taste buds'),
];
