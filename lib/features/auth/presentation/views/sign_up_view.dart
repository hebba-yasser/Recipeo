import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recpie_app/features/auth/data/repos/auth_repo_imp.dart';
import 'package:recpie_app/features/auth/presentation/manager/Auth_cubit/auth_cubit.dart';
import 'package:recpie_app/features/auth/presentation/views/widgets/sign_up_view_body.dart';

import '../../../../core/utils/service_locator.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(
        getIt.get<AuthRepoImp>(),
      ),
      child: const Scaffold(
        body: SafeArea(child: SignUpViewBody()),
      ),
    );
  }
}
