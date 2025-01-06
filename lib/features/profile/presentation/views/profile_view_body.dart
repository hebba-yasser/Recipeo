import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recpie_app/core/cubits/user_data_cubit/user_data_state.dart';
import 'package:recpie_app/features/profile/presentation/views/widgets/profile_content.dart';

import '../../../../constants.dart';
import '../../../../core/cubits/user_data_cubit/user_data_cubit.dart';
import '../../../../core/utils/functions/custom_loading_indicator.dart';
import '../../../../core/utils/service_locator.dart';
import '../../data/repos/profile_repos_imp.dart';
import '../manager/profile_cubit/profile_cubit.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => ProfileCubit(getIt.get<ProfileReposImp>())),
      ],
      child: BlocBuilder<UserDataCubit, UserDataState>(
        builder: (context, state) {
          if (state is UserDataSuccess) {
            return Stack(
              children: [
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: MediaQuery.of(context).size.height * .3,
                    decoration: const BoxDecoration(color: kprimaryColor),
                  ),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height * .25,
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                  ),
                ),
                ProfileContent(
                  user: state.user,
                ),
              ],
            );
          } else if (state is UserDataFailure) {
            return Center(
              child: Text(
                state.errMessage,
                textAlign: TextAlign.center,
              ),
            );
          } else {
            return customLoadingIndicator();
          }
        },
      ),
    );
  }
}
