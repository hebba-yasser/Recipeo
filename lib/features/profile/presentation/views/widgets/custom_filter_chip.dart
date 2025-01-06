import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/Views/widgets/cusom_filter_cip.dart';
import '../../../../../core/styles/fonts.dart';
import '../../manager/preferences_cubit/preferences_cubit.dart';

class ProfileFilterChips extends StatelessWidget {
  const ProfileFilterChips({
    super.key,
    required this.filterList,
    required this.selectedList,
    required this.showChips,
    required this.onButtonPressed,
  });

  final List<dynamic> filterList;
  final List<dynamic> selectedList;
  final bool showChips;
  final Function() onButtonPressed;

  @override
  Widget build(BuildContext context) {
    List<dynamic> displayedFilterList =
        showChips ? filterList : filterList.take(7).toList();

    return Column(
      children: [
        CustomFilterShip(
          displayedFilterList: displayedFilterList,
          selectedList: selectedList,
          onSelectedFunction:
              BlocProvider.of<PreferencesCubit>(context).updatePreference,
        ),
        if (filterList.length >= 10)
          TextButton(
            onPressed: onButtonPressed,
            child: Text(
              showChips ? 'Show Less' : 'Show More',
              style: AppFonts.caption,
            ),
          ),
      ],
    );
  }
}
