import 'package:flutter/material.dart';
import 'package:recpie_app/features/auth/presentation/views/sign_up_view.dart';

import '../../../../../core/Views/widgets/custom_text_button.dart';
import '../../../../../core/styles/fonts.dart';
import '../../../../../core/utils/functions/Navigaor_push.dart';

class TextButtonSignUp extends StatelessWidget {
  const TextButtonSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Don\'t have an account?',
          style: AppFonts.accentBody18.copyWith(
            color: Colors.black,
          ),
          textAlign: TextAlign.center,
        ),
        CustomTextButton(
          text: 'Sign Up',
          onPressed: () {
            navigatorPush(context, const SignUpView());
          },
        ),
      ],
    );
  }
}
