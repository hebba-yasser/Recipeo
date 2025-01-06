import 'package:flutter/material.dart';
import 'package:recpie_app/features/auth/presentation/views/widgets/prefeence_item.dart';
import 'package:recpie_app/features/auth/presentation/views/widgets/preference_page2.dart';

import '../../../../../core/data/data_sources/categories_data.dart';
import '../../../../../core/utils/functions/Navigaor_push.dart';
import '../../manager/Preference_Cubit/sign_up_preference_cubit.dart';

class PreferencePage1 extends StatelessWidget {
  const PreferencePage1({
    Key? key,
    required this.cubit,
  }) : super(key: key);
  final SignUpPreferenceCubit cubit;
  @override
  Widget build(
    BuildContext context,
  ) {
    return Scaffold(
      body: PreferenceItem(
        cubit: cubit,
        onPressed: () {
          navigatorPush(
            context,
            PreferencePage2(
              cubit: cubit,
            ),
          );
        },
        footer: "What are your favourite cuisines?",
        center: "25%",
        percent: .25,
        list: CategoriesDataSource.categoriesList[1],
        selectedList: cubit.cuisinesPreferences,
      ),
    );
  }
}
