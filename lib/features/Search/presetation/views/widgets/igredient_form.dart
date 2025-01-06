import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recpie_app/core/Views/widgets/selected_ingredients_list.dart';
import 'package:recpie_app/features/Search/presetation/manager/filter_cubit/filter_cubit.dart';

import '../../../../../constants.dart';
import '../../../../../core/Views/widgets/custom_text_form_field.dart';
import '../../../../../core/styles/fonts.dart';

class IngredientsForm extends StatefulWidget {
  const IngredientsForm({
    super.key,
  });

  @override
  State<IngredientsForm> createState() => _IngredientsFormState();
}

class _IngredientsFormState extends State<IngredientsForm> {
  final GlobalKey<FormState> formKey = GlobalKey();

  final TextEditingController includedIngredientsController =
      TextEditingController();

  final TextEditingController excludedIngredientsController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FilterCubit, FilterState>(
      builder: (context, state) {
        var cubit = BlocProvider.of<FilterCubit>(context);
        return Form(
          key: formKey,
          child: Expanded(
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    'Please list any ingredients you like to be included in your recipe..',
                    style: AppFonts.bodyText16
                        .copyWith(fontWeight: FontWeight.w500),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: CustomTextFormField(
                    prefixIcon: CupertinoIcons.list_dash,
                    prefixIconColor: kprimaryColor,
                    hintText: 'Included Ingredients',
                    hintStyle: AppFonts.caption,
                    keyboardText: TextInputType.text,
                    onFieldSubmitted: (newValue) {
                      if (newValue!.isNotEmpty & newValue.trim().isNotEmpty) {
                        cubit.selectIncludedIngredients(newValue);
                        includedIngredientsController.clear();
                      }
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'please write an ingredient';
                      }
                      return null;
                    },
                    controller: includedIngredientsController,
                  ),
                ),
                SelectedIngredientsList(
                  onPressed: BlocProvider.of<FilterCubit>(context)
                      .removeIncludedIngredient,
                  ingredientList: cubit.includedIngredients,
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    "Please list any ingredients to excluded from your recipe, including any you may be allergic to..",
                    style: AppFonts.bodyText16
                        .copyWith(fontWeight: FontWeight.w500),
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
                  onPressed: BlocProvider.of<FilterCubit>(context)
                      .removeExcludedIngredient,
                  ingredientList: cubit.excludedIngredients,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
