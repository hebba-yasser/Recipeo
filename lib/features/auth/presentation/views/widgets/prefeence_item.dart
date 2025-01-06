import 'package:flutter/cupertino.dart';

import '../../manager/Preference_Cubit/sign_up_preference_cubit.dart';
import 'back_ground_image.dart';
import 'button.dart';
import 'grid.dart';
import 'indicator.dart';

class PreferenceItem extends StatelessWidget {
  const PreferenceItem({
    super.key,
    required this.cubit,
    required this.onPressed,
    required this.footer,
    required this.center,
    required this.percent,
    required this.list,
    required this.selectedList,
  });
  final SignUpPreferenceCubit cubit;
  final Function() onPressed;
  final String footer;
  final String center;
  final double percent;
  final list;
  final selectedList;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const BackGroundImage(),
        Button(
          selectedList: selectedList,
          onPressed: onPressed,
        ),
        Indicator(
          footer: footer,
          center: center,
          percent: percent,
        ),
        Grid(
          cubit: cubit,
          list: list,
          selectedList: selectedList,
        ),
      ],
    );
  }
}
