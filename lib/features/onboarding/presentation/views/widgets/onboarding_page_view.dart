import 'package:flutter/material.dart';

import '../../../data/data_souces/onboarding_data.dart';
import '../../../data/models/onboarding_model.dart';
import '../../manager/onboarding_cubit/onboarding_cubit.dart';
import 'onboarding_item.dart';

class OnboardingPageView extends StatelessWidget {
  const OnboardingPageView({
    super.key,
    required this.cubit,
    required this.model,
  });

  final OnboardingCubit cubit;
  final List<OnboardingModel> model;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: PageView.builder(
        controller: cubit.boardController,
        physics: const BouncingScrollPhysics(),
        onPageChanged: (index) {
          cubit.setPage(index); // Update cubit with new page index
        },
        itemBuilder: (context, index) {
          return OnboardingItem(
            model: model[index],
          );
        },
        itemCount: onboardingData.length,
      ),
    );
  }
}
