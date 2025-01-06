import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recpie_app/features/auth/presentation/views/widgets/prefeence_item.dart';
import 'package:recpie_app/features/auth/presentation/views/widgets/preference_page4.dart';

import '../../../../../core/data/data_sources/categories_data.dart';
import '../../../../../core/utils/functions/Navigaor_push.dart';
import '../../manager/Preference_Cubit/sign_up_preference _state.dart';
import '../../manager/Preference_Cubit/sign_up_preference_cubit.dart';

class PreferencePage3 extends StatelessWidget {
  const PreferencePage3({
    Key? key,
    required this.cubit,
  }) : super(key: key);
  final SignUpPreferenceCubit cubit;

  @override
  Widget build(
    BuildContext context,
  ) {
    return BlocProvider.value(
      value: cubit,
      child: BlocBuilder<SignUpPreferenceCubit, SignUpPreferenceState>(
        builder: (context, state) {
          return Scaffold(
            body: PreferenceItem(
              cubit: cubit,
              onPressed: () {
                navigatorPush(
                  context,
                  PreferencePage4(
                    cubit: cubit,
                  ),
                );
              },
              footer: "Any Allergies?",
              center: "75%",
              percent: .75,
              list: CategoriesDataSource.categoriesList[4],
              selectedList: cubit.intolerancePreferences,
            ),
          );
        },
      ),
    );
  }
}
