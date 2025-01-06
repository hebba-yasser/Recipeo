import 'package:flutter/material.dart';

import 'auth_text_and_button.dart';
import 'gradient_image.dart';

class AuthViewBody extends StatelessWidget {
  const AuthViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        GradientImage(),
        SizedBox(
          height: 10,
        ),
        AuthTextButton(),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
