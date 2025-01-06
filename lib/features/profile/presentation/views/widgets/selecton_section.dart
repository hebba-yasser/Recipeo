import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recpie_app/core/Views/widgets/black_search_button.dart';
import 'package:recpie_app/core/data/data_sources/preferences_data.dart';
import 'package:recpie_app/core/utils/functions/custom_loading_indicator.dart';
import 'package:recpie_app/features/profile/presentation/manager/preferences_cubit/preferences_cubit.dart';

import '../../../../../constants.dart';
import '../../../../../core/Views/widgets/custom_text_form_field.dart';
import '../../../../../core/Views/widgets/selected_ingredients_list.dart';
import '../../../../../core/data/models/user_model/user_model.dart';
import '../../../../../core/styles/fonts.dart';
import '../../manager/preferences_cubit/preferences_state.dart';
import 'custom_filter_chip.dart';

class SelectionSection extends StatefulWidget {
  const SelectionSection({
    super.key,
    required this.user,
    required this.cubitState,
  });

  final UserModel user;
  final PreferencesState cubitState;

  @override
  State<SelectionSection> createState() => _SelectionSectionState();
}

class _SelectionSectionState extends State<SelectionSection> {
  final TextEditingController excludedIngredientsController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<PreferencesCubit>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          child: Text(
            'write any foods to avoid',
            style: AppFonts.bodyText16.copyWith(fontWeight: FontWeight.w500),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: CustomTextFormField(
            prefixIcon: CupertinoIcons.nosign,
            prefixIconColor: kprimaryColor,
            hintText: 'Excluded Ingredients',
            hintStyle: AppFonts.caption,
            keyboardText: TextInputType.text,
            onFieldSubmitted: (newValue) {
              if (newValue!.isNotEmpty & newValue.trim().isNotEmpty) {
                cubit.selectExcludedIngredients(newValue);
                excludedIngredientsController.clear();
              }
            },
            validator: (value) {
              if (value!.isEmpty) {
                return 'please write an ingredient';
              }
              return null;
            },
            controller: excludedIngredientsController,
          ),
        ),
        SelectedIngredientsList(
          onPressed: cubit.removeExcludedIngredient,
          ingredientList: cubit.excludedIngredientsPreferences,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          child: Text(
            'Do you have any dietary restrictions?',
            style: AppFonts.bodyText16.copyWith(fontWeight: FontWeight.w500),
          ),
        ),
        ProfileFilterChips(
          selectedList: cubit.dietsPreferences,
          filterList: PreferencesDataSource.dietList,
          onButtonPressed: () {
            cubit.toggleDiets();
          },
          showChips: cubit.showDiets,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          child: Text(
            'Do you have Allergies?',
            style: AppFonts.bodyText16.copyWith(fontWeight: FontWeight.w500),
          ),
        ),
        ProfileFilterChips(
          selectedList: cubit.intolerancePreferences,
          filterList: PreferencesDataSource.intoleranceList,
          onButtonPressed: () {
            cubit.toggleIntolerance();
          },
          showChips: cubit.showIntolerance,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          child: Text(
            'Choose your Favourite cuisines',
            style: AppFonts.bodyText16.copyWith(fontWeight: FontWeight.w500),
          ),
        ),
        ProfileFilterChips(
          selectedList: cubit.cuisinesPreferences,
          filterList: PreferencesDataSource.cuisinesList,
          onButtonPressed: () {
            cubit.toggleCuisines();
          },
          showChips: cubit.showCuisines,
        ),
        (widget.cubitState is SavePreferencesLoading)
            ? customLoadingIndicator()
            : CustomBlackButton(
                title: 'Save',
                onPressed: () {
                  cubit.updatePreferencesData();
                })
      ],
    );
  }
}
