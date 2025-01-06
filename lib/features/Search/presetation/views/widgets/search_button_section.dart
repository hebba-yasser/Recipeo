import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recpie_app/features/Search/presetation/views/widgets/search_button_listener.dart';

import '../../../../../core/Views/widgets/black_search_button.dart';
import '../../manager/filter_cubit/filter_cubit.dart';

class SearchButtonSection extends StatelessWidget {
  const SearchButtonSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FilterCubit, FilterState>(
      builder: (context, filterState) {
        var filterCubit = BlocProvider.of<FilterCubit>(context);
        if (filterState is FiltersNotEmpty) {
          return SearchButtonListener(filterCubit: filterCubit);
        } else {
          return CustomBlackButton(
            onPressed: () {},
            isButtonDisabled: true,
            title: 'Search',
          );
        }
      },
    );
  }
}
