import 'package:flutter/material.dart';
import 'package:recpie_app/features/auth/presentation/views/auth_view.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../../constants.dart';
import '../../../../../core/styles/colors.dart';
import '../../../../../core/utils/functions/Navigator_to_auth.dart';
import '../../../data/data_souces/onboarding_data.dart';
import '../../manager/onboarding_cubit/onboarding_cubit.dart';

class OnboardingFloatingButtons extends StatelessWidget {
  const OnboardingFloatingButtons({
    super.key,
    required this.cubit,
  });
  final OnboardingCubit cubit;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          (cubit.currentPage != 0)
              ? FloatingActionButton(
                  onPressed: () {
                    cubit.previousPage();
                  },
                  backgroundColor: cubit.currentPage == 0
                      ? Colors.grey // Disable the button on the first page
                      : kprimaryColor,
                  child: const Icon(
                    Icons.arrow_back,
                  ),
                )
              : const SizedBox(
                  width: 56,
                ),
          SmoothPageIndicator(
            controller: cubit.boardController,
            count: 3,
            effect: const ScrollingDotsEffect(
              activeDotColor: kprimaryColor,
              dotColor: AppColors.lightPeach,
              dotHeight: 15,
              dotWidth: 15,
              spacing: 10,
            ),
          ),
          FloatingActionButton(
            onPressed: () {
              if (cubit.currentPage < onboardingData.length - 1) {
                cubit.nextPage(onboardingData.length);
              } else {
                navigatorPushAndRemove(context, const AuthView());
              }
            },
            child: const Icon(Icons.arrow_forward),
          ),
        ],
      ),
    );
  }
}
