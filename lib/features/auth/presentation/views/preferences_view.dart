import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recpie_app/features/auth/data/repos/auth_repo_imp.dart';
import 'package:recpie_app/features/auth/presentation/views/widgets/preferences_view_body.dart';

import '../../../../core/utils/service_locator.dart';
import '../manager/Preference_Cubit/sign_up_preference_cubit.dart';

class SignUpPreferencesView extends StatelessWidget {
  const SignUpPreferencesView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpPreferenceCubit(
        getIt.get<AuthRepoImp>(),
      ),
      child: const Scaffold(
        body: SignUpPreferencesViewBody(),
      ),
    );
  }
}
