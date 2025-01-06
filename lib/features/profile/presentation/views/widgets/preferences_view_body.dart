import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recpie_app/features/profile/presentation/manager/preferences_cubit/preferences_state.dart';
import 'package:recpie_app/features/profile/presentation/views/widgets/selecton_section.dart';

import '../../../../../constants.dart';
import '../../../../../core/Views/widgets/header_desc_text.dart';
import '../../../../../core/data/models/user_model/user_model.dart';
import '../../../../../core/utils/functions/custom_show_toast.dart';
import '../../../../home/presentation/manager/fetch_personalized_recipes_cubit/fetch_personalized_recipes_cubit.dart';
import '../../manager/preferences_cubit/preferences_cubit.dart';
import 'close_alert.dart';

class PreferencesViewBody extends StatelessWidget {
  const PreferencesViewBody({super.key, required this.user});

  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PreferencesCubit, PreferencesState>(
      listener: (context, state) {
        if (state is SavePreferencesSuccess) {
          context
              .read<FetchPersonalizedRecipesCubit>()
              .fetchPersonalizedRecipes(
                id: uId!,
              );

          Navigator.pop(context);
        }
        if (state is SavePreferencesError) {
          customShowToast(state.errMessage);
        }
      },
      builder: (context, state) {
        return ListView(
          children: [
            (state is SavePreferencesLoading)
                ? const LinearProgressIndicator(
                    backgroundColor: kprimaryColor,
                  )
                : const CloseAlert(),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: HeaderDescText(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  subTitleAlign: TextAlign.left,
                  subTitle:
                      'Tell us about your preferences and we can choose the best recipes for you ',
                  title: 'Your Preferences'),
            ),
            SelectionSection(
              cubitState: state,
              user: user,
            ),
          ],
        );
      },
    );
  }
}
