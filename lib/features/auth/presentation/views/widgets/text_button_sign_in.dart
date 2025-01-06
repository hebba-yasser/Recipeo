import 'package:flutter/material.dart';

import '../../../../../core/Views/widgets/custom_text_button.dart';
import '../../../../../core/styles/fonts.dart';
import '../../../../../core/utils/functions/Navigaor_push.dart';
import '../sign_in_view.dart';

class TextButtonSIgnIn extends StatelessWidget {
  const TextButtonSIgnIn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Already have an account?',
          style: AppFonts.accentBody18.copyWith(
            color: Colors.black,
          ),
          textAlign: TextAlign.center,
        ),
        CustomTextButton(
          text: 'Sign In',
          onPressed: () {
            navigatorPush(context, const SignInView());
          },
        ),
      ],
    );
  }
}
