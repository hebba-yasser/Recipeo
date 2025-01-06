import 'package:flutter/material.dart';

import '../../../../../constants.dart';
import '../../../../../core/styles/colors.dart';
import '../../../../../core/styles/fonts.dart';
import '../../../../../core/utils/assets.dart';

class GradientImage extends StatelessWidget {
  const GradientImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .55,
      width: double.infinity,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            AppAssets.authImg,
            fit: BoxFit.cover,
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppColors.cream.withOpacity(1),
                  AppColors.cream.withOpacity(0.1),
                  AppColors.cream.withOpacity(0.1),

                  // Transparent middle
                  Colors.transparent,
                  // Bottom Gradient
                  AppColors.cream.withOpacity(0.1),
                  AppColors.cream.withOpacity(0.8),
                  AppColors.cream.withOpacity(1),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 16,
            right: 16,
            child: Text(
              'Your Recipe Heaven Awaits Exploration',
              style: AppFonts.accentHeading.copyWith(color: kprimaryColor),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
