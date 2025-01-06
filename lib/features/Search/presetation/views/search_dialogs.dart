// lib/features/search/view/search_dialogs.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/functions/custom_show_dialog.dart';
import '../manager/filter_cubit/filter_cubit.dart';

class SearchDialogs {
  static Future<dynamic> searchExitAlert(BuildContext context) {
    return customShowDialog(
      context: context,
      title: 'Exit',
      description:
          'Are you sure you want to exit? All your selections will be deleted.',
      titleButton2: 'Yes',
      onPressed2: () {
        Navigator.pop(context);
        Navigator.pop(context);
      },
      titleButton1: 'No',
      onPressed1: () {
        Navigator.pop(context);
      },
    );
  }

  static Future<dynamic> searchClearAllAlert(BuildContext context) {
    return customShowDialog(
      context: context,
      title: 'Clear All',
      description: 'Are you sure you want to clear all your selections?',
      titleButton2: 'Yes',
      onPressed2: () {
        BlocProvider.of<FilterCubit>(context).clearALLChips();
        Navigator.pop(context);
      },
      titleButton1: 'No',
      onPressed1: () {
        Navigator.pop(context);
      },
    );
  }
}
