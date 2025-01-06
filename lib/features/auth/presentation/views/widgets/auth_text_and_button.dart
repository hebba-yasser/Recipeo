import 'package:flutter/material.dart';
import 'package:recpie_app/features/auth/presentation/views/sign_up_view.dart';
import 'package:recpie_app/features/auth/presentation/views/widgets/text_button_sign_in.dart';

import '../../../../../core/Views/widgets/custom_button.dart';
import '../../../../../core/styles/fonts.dart';
import '../../../../../core/utils/functions/Navigaor_push.dart';

class AuthTextButton extends StatelessWidget {
  const AuthTextButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        children: [
          Text(
            'Spice up your life with our app! Discover new flavors, experiment with different ingredients, and unleash your inner chef ',
            style: AppFonts.accentBody18,
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 20,
          ),
          CustomButton(
            text: 'Let\'s Get Started',
            onPressed: () {
              navigatorPush(context, const SignUpView());
            },
          ),
          const SizedBox(
            height: 10,
          ),
          const TextButtonSIgnIn(),
        ],
      ),
    );
  }
}
