import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recpie_app/features/profile/presentation/manager/update_profile_cubit/update_profile_state.dart';

import '../../../../../constants.dart';
import '../../../../../core/Views/widgets/custom_back_button.dart';
import '../../../../../core/styles/fonts.dart';
import '../../manager/update_profile_cubit/update_profile_cubit.dart';

class EditProfileAppBar extends StatelessWidget {
  const EditProfileAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<UpdateProfileCubit>(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CustomBackButton(),
          Expanded(
            child: Center(
              child: Text(
                'title',
                style: AppFonts.heading20,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          BlocBuilder<UpdateProfileCubit, UpdateProfileState>(
            builder: (context, state) {
              if (state is UpdateProfileLoading) {
                return Text(
                  'Saving...',
                  style: AppFonts.caption,
                );
              }
              return IconButton(
                  padding: const EdgeInsets.all(0),
                  onPressed: () {
                    if (cubit.formKey.currentState!.validate()) {
                      cubit.updateProfileData();
                    }
                  },
                  icon: const Icon(
                    Icons.edit,
                    color: kprimaryColor,
                  ));
            },
          ),
        ],
      ),
    );
  }
}
