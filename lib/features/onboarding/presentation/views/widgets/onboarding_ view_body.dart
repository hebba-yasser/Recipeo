import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recpie_app/features/onboarding/data/models/onboarding_model.dart';

import '../../../data/data_souces/onboarding_data.dart';
import '../../manager/onboarding_cubit/onboarding_cubit.dart';
import 'onboarding_page_view.dart';
import 'onboaring_floatingbuttons.dart';

class OnboardingViewBody extends StatelessWidget {
  const OnboardingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnboardingCubit, OnboardingState>(
      builder: (context, state) {
        final cubit = BlocProvider.of<OnboardingCubit>(context);
        final List<OnboardingModel> model = onboardingData;
        return Column(
          children: [
            OnboardingPageView(cubit: cubit, model: model),
            OnboardingFloatingButtons(cubit: cubit),
            const SizedBox(
              height: 40,
            ),
          ],
        );
      },
    );
  }
}
