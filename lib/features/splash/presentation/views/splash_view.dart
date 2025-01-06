import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:recpie_app/features/home/presentation/views/home_view.dart';
import 'package:recpie_app/features/splash/presentation/views/widgets/splash_view_body.dart';

import '../../../../constants.dart';
import '../../../onboarding/presentation/views/onboarding_view.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
        splash: const SplashViewBody(),
        nextScreen: isLogged ? const HomeView() : const OnboardingView(),
        splashTransition: SplashTransition.fadeTransition,
        pageTransitionType: PageTransitionType.fade,
        backgroundColor: kprimaryColor,
        splashIconSize: 300,
        duration: 2000);
  }
}
