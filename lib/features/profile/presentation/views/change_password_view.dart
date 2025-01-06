import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recpie_app/core/utils/service_locator.dart';
import 'package:recpie_app/features/profile/data/repos/profile_repos_imp.dart';
import 'package:recpie_app/features/profile/presentation/manager/Change_password_cubit/change_password_cubit.dart';
import 'package:recpie_app/features/profile/presentation/views/widgets/change_password_view_body.dart';

class ChangePasswordView extends StatelessWidget {
  const ChangePasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChangePasswordCubit(getIt.get<ProfileReposImp>()),
      child: Scaffold(
        body: SafeArea(child: ChangePasswordViewBody()),
      ),
    );
  }
}
