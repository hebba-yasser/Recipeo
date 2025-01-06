import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../manager/Preference_Cubit/sign_up_preference _state.dart';
import '../../manager/Preference_Cubit/sign_up_preference_cubit.dart';
import 'grid_item.dart';

class Grid extends StatelessWidget {
  const Grid({
    super.key,
    this.list,
    this.selectedList,
    required this.cubit,
  });

  final list;
  final selectedList;
  final SignUpPreferenceCubit cubit;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpPreferenceCubit, SignUpPreferenceState>(
      builder: (cubitContext, state) {
        return Positioned(
          top: 280,
          left: 0,
          right: 0,
          bottom: 0,
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemBuilder: (context, index) {
              final subCategory = list.subCategories[index];
              return GridItem(
                label: subCategory.subCategoryName,
                selectedList: selectedList,
                title: subCategory.subCategoryName,
                image: subCategory.subCategoryImagePath,
                onTap: () {
                  cubit.updatePreference(
                      selectedList, subCategory.subCategoryName);
                },
              );
            },
            itemCount: list.subCategories.length,
          ),
        );
      },
    );
  }
}
