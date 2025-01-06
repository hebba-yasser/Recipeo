import 'package:flutter/material.dart';

import '../../../../../core/styles/fonts.dart';
import '../../../../../core/utils/functions/Navigator_to_auth.dart';
import '../../../../auth/presentation/views/auth_view.dart';

class CurvedContainer extends StatelessWidget {
  const CurvedContainer({
    super.key,
    required this.image,
    required this.backgroundColor,
    required this.foregroundColor,
  });
  final String image;
  final Color backgroundColor;
  final Color foregroundColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(image), fit: BoxFit.fill),
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
            bottom: Radius.elliptical(MediaQuery.of(context).size.width, 80.0)),
      ),
      child: SafeArea(
        child: Align(
          alignment: Alignment.topRight,
          child: TextButton(
            onPressed: () {
              navigatorPushAndRemove(context, const AuthView());
            },
            style: TextButton.styleFrom(
              backgroundColor: backgroundColor,
              foregroundColor: foregroundColor,
            ),
            child: Text(
              'Skip',
              style: AppFonts.accentBody22.copyWith(
                  color: foregroundColor, fontWeight: FontWeight.w700),
            ),
          ),
        ),
      ),
    );
  }
}
