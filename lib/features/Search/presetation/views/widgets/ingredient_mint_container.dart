import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/styles/colors.dart';
import '../../../../../core/styles/fonts.dart';
import '../../../../../core/utils/functions/Navigaor_push.dart';
import '../../manager/filter_cubit/filter_cubit.dart';
import '../select_ingredient_view.dart';

class IngredientMintContainer extends StatelessWidget {
  const IngredientMintContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10),
      child: ListTile(
        onTap: () {
          navigatorPush(
            context,
            SelectIngredientView(
              filterCubit: BlocProvider.of<FilterCubit>(context),
            ),
          );
        },
        tileColor: AppColors.mintGreen,
        contentPadding: const EdgeInsets.all(12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        trailing: IconButton(
            onPressed: () {
              navigatorPush(
                context,
                SelectIngredientView(
                  filterCubit: BlocProvider.of<FilterCubit>(context),
                ),
              );
            },
            icon: const Icon(Icons.arrow_forward_ios)),
        title: Text(
          'Find recipes based on what you already have at home',
          style: AppFonts.bodyText16,
        ),
      ),
    );
  }
}
