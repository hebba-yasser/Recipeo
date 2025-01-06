import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recpie_app/features/Search/presetation/manager/filter_cubit/filter_cubit.dart';
import 'package:recpie_app/features/Search/presetation/views/widgets/search_chip_item.dart';

import '../../../../../core/data/data_sources/preferences_data.dart';

class ChipsSelectionSection extends StatelessWidget {
  const ChipsSelectionSection({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FilterCubit, FilterState>(
      builder: (context, state) {
        var cubit = BlocProvider.of<FilterCubit>(context);
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SearchChipItem(
              textTitle: 'DishType',
              show: cubit.showDishType,
              toggleFunction: () => cubit.toggleDishType(),
              displayedFilterList: PreferencesDataSource.dishTypeList,
              selectedList: cubit.selectedDishType,
              onSelectedFunction: cubit.updatePreference,
            ),
            SearchChipItem(
              textTitle: 'Cuisines',
              show: cubit.showCuisines,
              toggleFunction: () => cubit.toggleCuisines(),
              displayedFilterList: PreferencesDataSource.cuisinesList,
              selectedList: cubit.selectedCuisines,
              onSelectedFunction: cubit.updatePreference,
            ),
            SearchChipItem(
              textTitle: 'Diets',
              show: cubit.showDiets,
              toggleFunction: () => cubit.toggleDiets(),
              displayedFilterList: PreferencesDataSource.dietList,
              selectedList: cubit.selectedDiets,
              onSelectedFunction: cubit.updatePreference,
            ),
            SearchChipItem(
              textTitle: 'Intolerances',
              show: cubit.showIntolerance,
              toggleFunction: () => cubit.toggleIntolerance(),
              displayedFilterList: PreferencesDataSource.intoleranceList,
              selectedList: cubit.selectedIntolerance,
              onSelectedFunction: cubit.updatePreference,
            ),
          ],
        );
      },
    );
  }
}
