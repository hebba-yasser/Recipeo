import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recpie_app/features/auth/presentation/views/widgets/prefeence_item.dart';
import 'package:recpie_app/features/auth/presentation/views/widgets/preference_page3.dart';

import '../../../../../core/data/data_sources/categories_data.dart';
import '../../../../../core/utils/functions/Navigaor_push.dart';
import '../../manager/Preference_Cubit/sign_up_preference _state.dart';
import '../../manager/Preference_Cubit/sign_up_preference_cubit.dart';

class PreferencePage2 extends StatelessWidget {
  const PreferencePage2({
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
                  PreferencePage3(
                    cubit: cubit,
                  ),
                );
              },
              footer: "Any dietary restriction?",
              center: "50%",
              percent: .50,
              list: CategoriesDataSource.categoriesList[3],
              selectedList: cubit.dietsPreferences,
            ),
          );
        },
      ),
    );
  }
}
