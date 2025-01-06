import 'package:flutter/material.dart';
import 'package:recpie_app/features/auth/presentation/views/widgets/auth_view_body.dart';

import '../../../../core/styles/colors.dart';

class AuthView extends StatelessWidget {
  const AuthView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.cream,
      body: SafeArea(child: AuthViewBody()),
    );
  }
}
