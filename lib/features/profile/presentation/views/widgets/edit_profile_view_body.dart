import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recpie_app/core/utils/functions/custom_show_toast.dart';
import 'package:recpie_app/features/profile/presentation/manager/update_profile_cubit/update_profile_cubit.dart';
import 'package:recpie_app/features/profile/presentation/manager/update_profile_cubit/update_profile_state.dart';

import 'edit_profile_app_bar.dart';
import 'edit_profile_form.dart';
import 'edit_profile_image.dart';

class EditProfileViewBody extends StatelessWidget {
  const EditProfileViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<UpdateProfileCubit, UpdateProfileState>(
        listener: (context, state) {
          if (state is UpdateProfileSuccess) {
            customShowToast('Your data is updated successfully');
            Navigator.pop(context);
          }
          if (state is UpdateProfileFailure) {
            customShowToast("Failed to update profile: ${state.errMessage}");
          }
        },
        child: ListView(
          children: const [
            EditProfileAppBar(),
            EditProfileImage(),
            EditProfileForm(),
          ],
        ));
  }
}
