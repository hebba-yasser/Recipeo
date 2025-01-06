import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recpie_app/core/styles/colors.dart';
import 'package:recpie_app/features/onboarding/presentation/views/widgets/onboarding_ view_body.dart';

import '../manager/onboarding_cubit/onboarding_cubit.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OnboardingCubit(),
      child: const Scaffold(
        backgroundColor: AppColors.cream,
        body: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle(
            statusBarColor: Colors.transparent, // Set the status bar color
            statusBarIconBrightness: Brightness.dark, // Set icon brightness
          ),
          child: OnboardingViewBody(),
        ),
      ),
    );
  }
}
