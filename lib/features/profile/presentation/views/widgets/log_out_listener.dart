import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recpie_app/features/profile/presentation/views/widgets/profile_list_tile_item.dart';

import '../../../../../core/utils/functions/Navigator_to_auth.dart';
import '../../../../../core/utils/functions/custom_show_dialog.dart';
import '../../../../../core/utils/functions/custom_show_toast.dart';
import '../../../../auth/presentation/views/sign_in_view.dart';
import '../../manager/profile_cubit/profile_cubit.dart';

class LogOutListener extends StatelessWidget {
  const LogOutListener({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit, ProfileState>(
      listener: (context, state) {
        if (state is ProfileLogOutSuccess) {
          navigatorPushAndRemove(context, const SignInView());
        } else if (state is ProfileLogOutFailure) {
          customShowToast(state.errMessage);
        }
      },
      builder: (context, state) {
        return ProfileListTileItem(
          onTap: () {
            customShowDialog(
              context: context,
              title: 'Logout',
              description: 'Are you sure,you want to logout?',
              titleButton1: 'Cancel',
              titleButton2: 'Log out',
              onPressed2: () async {
                Navigator.pop(context);

                await BlocProvider.of<ProfileCubit>(context)
                    .logOutFromProfile();
              },
              onPressed1: () {
                Navigator.pop(context);
              },
            );
          },
          title: 'Log out',
          leadingIcon: Icons.logout,
        );
      },
    );
  }
}
