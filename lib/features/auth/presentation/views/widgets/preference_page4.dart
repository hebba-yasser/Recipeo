import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recpie_app/features/auth/presentation/manager/Preference_Cubit/sign_up_preference_cubit.dart';

import '../../../../../constants.dart';
import '../../../../../core/Views/widgets/custom_text_form_field.dart';
import '../../../../../core/Views/widgets/selected_ingredients_list.dart';
import '../../../../../core/styles/fonts.dart';
import '../../../../../core/utils/functions/Navigator_to_auth.dart';
import '../../../../../core/utils/functions/custom_show_toast.dart';
import '../../manager/Preference_Cubit/sign_up_preference _state.dart';
import '../sign_in_view.dart';
import 'back_ground_image.dart';
import 'button.dart';
import 'indicator.dart';

class PreferencePage4 extends StatefulWidget {
  const PreferencePage4({
    Key? key,
    required this.cubit,
  }) : super(key: key);
  final SignUpPreferenceCubit cubit;

  @override
  State<PreferencePage4> createState() => _PreferencePage4State();
}

class _PreferencePage4State extends State<PreferencePage4> {
  final TextEditingController excludedIngredientsController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: widget.cubit,
      child: BlocConsumer<SignUpPreferenceCubit, SignUpPreferenceState>(
        listener: (context, state) {
          if (state is SignUpSavePreferencesSuccess) {
            navigatorPushAndRemove(context, const SignInView());
          }
          if (state is SignUpSavePreferencesError) {
            customShowToast(state.errMessage);
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: Stack(
              children: [
                const BackGroundImage(),
                (state is SignUpSavePreferencesLoading)
                    ? const Positioned(
                        top: 30,
                        right: 0,
                        child: CircularProgressIndicator(
                          color: kprimaryColor,
                        ),
                      )
                    : Button(
                        selectedList:
                            widget.cubit.excludedIngredientsPreferences,
                        onPressed: () {
                          widget.cubit.updateUserPreferences();
                        },
                      ),
                const Indicator(
                  footer: 'Any foods to avoid?',
                  center: '100%',
                  percent: 1,
                ),
                Positioned(
                  top: 280,
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: ListView(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: CustomTextFormField(
                          prefixIcon: CupertinoIcons.nosign,
                          prefixIconColor: kprimaryColor,
                          hintText: 'Excluded Ingredients',
                          hintStyle: AppFonts.caption,
                          keyboardText: TextInputType.text,
                          onFieldSubmitted: (newValue) {
                            if (newValue!.isNotEmpty &
                                newValue.trim().isNotEmpty) {
                              widget.cubit.selectExcludedIngredients(newValue);
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
                      IntrinsicHeight(
                        child: SelectedIngredientsList(
                          onPressed: widget.cubit.removeExcludedIngredient,
                          ingredientList:
                              widget.cubit.excludedIngredientsPreferences,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
