import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recpie_app/core/utils/service_locator.dart';
import 'package:recpie_app/features/profile/data/repos/profile_repos_imp.dart';
import 'package:recpie_app/features/profile/presentation/manager/preferences_cubit/preferences_cubit.dart';
import 'package:recpie_app/features/profile/presentation/views/widgets/preferences_view_body.dart';

import '../../../../core/data/models/user_model/user_model.dart';

class PreferencesView extends StatelessWidget {
  const PreferencesView({
    super.key,
    required this.user,
  });
  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PreferencesCubit(
            user,
            getIt.get<ProfileReposImp>(),
          ),
        ),
      ],
      child: Scaffold(
        body: SafeArea(
            child: PreferencesViewBody(
          user: user,
        )),
      ),
    );
  }
}
