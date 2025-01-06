import 'package:flutter/material.dart';
import 'package:recpie_app/features/Search/presetation/views/widgets/selection_text.dart';
import 'package:recpie_app/features/Search/presetation/views/widgets/text_section.dart';

import '../../../../../core/Views/widgets/cusom_filter_cip.dart';

class SearchChipItem extends StatelessWidget {
  const SearchChipItem({
    super.key,
    required this.textTitle,
    required this.show,
    required this.toggleFunction,
    required this.displayedFilterList,
    required this.selectedList,
    required this.onSelectedFunction,
  });

  final String textTitle;
  final bool show;
  final Function() toggleFunction;
  final List displayedFilterList;
  final List selectedList;
  final onSelectedFunction;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TileSection(
          textTitle: textTitle,
          show: show,
          toggleFunction: toggleFunction,
        ),
        show
            ? CustomFilterShip(
                displayedFilterList: displayedFilterList,
                selectedList: selectedList,
                onSelectedFunction: onSelectedFunction,
              )
            : SelectionText(cubitSelectedChips: selectedList, title: textTitle),
      ],
    );
  }
}
