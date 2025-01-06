import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/Views/widgets/custom_clear_all_app_bar.dart';
import '../../../../../core/utils/functions/custom_show_dialog.dart';
import '../../manager/preferences_cubit/preferences_cubit.dart';

class CloseAlert extends StatelessWidget {
  const CloseAlert({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10),
      child: CustomClearAllAppBar(
        clearAllOnPressed: () {
          customShowDialog(
              context: context,
              title: 'Clear All',
              description: 'Are you sure you want to clear all your selections',
              titleButton2: 'Clear',
              onPressed2: () {
                BlocProvider.of<PreferencesCubit>(context)
                    .clearAllPreferences();
                Navigator.pop(context);
              },
              titleButton1: 'Cancel',
              onPressed1: () {
                Navigator.pop(context);
              });
        },
        exitOnPressed: () {
          customShowDialog(
              context: context,
              title: 'Exit',
              description:
                  'Are you sure you want to exit? Make sure you saved your selections or it will be Deleted ',
              titleButton2: 'Save',
              onPressed2: () {
                BlocProvider.of<PreferencesCubit>(context)
                    .updatePreferencesData();
                Navigator.pop(context);
              },
              titleButton1: 'Exit',
              onPressed1: () {
                Navigator.pop(context);
                Navigator.pop(context);
              });
        },
      ),
    );
  }
}
