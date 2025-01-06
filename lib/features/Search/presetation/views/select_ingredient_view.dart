import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recpie_app/features/Search/presetation/views/widgets/select_ingredient_view_body.dart';

import '../manager/filter_cubit/filter_cubit.dart';

class SelectIngredientView extends StatelessWidget {
  const SelectIngredientView({super.key, required this.filterCubit});
  final FilterCubit filterCubit;

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: filterCubit,
      child: const Scaffold(
        body: SafeArea(child: SelectIngredientViewBody()),
      ),
    );
  }
}
