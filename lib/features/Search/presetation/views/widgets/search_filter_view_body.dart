import 'package:flutter/material.dart';
import 'package:recpie_app/features/Search/presetation/views/widgets/search_button_section.dart';
import 'package:recpie_app/features/Search/presetation/views/widgets/search_form.dart';

import '../../../../../core/Views/widgets/custom_clear_all_app_bar.dart';
import '../../../../../core/styles/fonts.dart';
import '../search_dialogs.dart';
import 'chips_selection_sectiom.dart';
import 'ingredient_mint_container.dart';

class SearchFilterViewBody extends StatefulWidget {
  const SearchFilterViewBody({super.key});

  @override
  State<SearchFilterViewBody> createState() => _SearchFilterViewBodyState();
}

class _SearchFilterViewBodyState extends State<SearchFilterViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10),
          child: CustomClearAllAppBar(
            clearAllOnPressed: () {
              SearchDialogs.searchClearAllAlert(context);
            },
            exitOnPressed: () {
              SearchDialogs.searchExitAlert(context);
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 12,
          ),
          child: Text(
            'Filter',
            style: AppFonts.heading22,
          ),
        ),
        const SearchForm(),
        const IngredientMintContainer(),
        const ChipsSelectionSection(),
        const SearchButtonSection(),
      ],
    );
  }
}
