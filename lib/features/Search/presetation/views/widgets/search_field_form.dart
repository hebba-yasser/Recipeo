import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../constants.dart';
import '../../../../../core/Views/widgets/custom_text_form_field.dart';
import '../../../../../core/styles/fonts.dart';
import '../../manager/fetch_recipes_by_query_cubit/fetch_recipe_by_query_cubit.dart';
import '../../manager/suggestion_cubit/suggestions_cubit.dart';

class SearchFieldForm extends StatelessWidget {
  const SearchFieldForm({
    super.key,
    required this.formKey,
    required this.suggestionCubit,
  });

  final GlobalKey<FormState> formKey;
  final SuggestionsCubit suggestionCubit;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: CustomTextFormField(
        controller: suggestionCubit.controller,
        prefixIcon: FontAwesomeIcons.magnifyingGlass,
        prefixIconColor: kprimaryColor,
        hintText: 'Search any recipe...',
        suffixIcon: Icons.clear,
        suffixIconColor: kprimaryColor,
        suffixOnPressed: () {
          suggestionCubit.controller.clear();
          suggestionCubit.stopTyping();
          FocusScope.of(context).requestFocus(FocusNode());
        },
        hintStyle: AppFonts.caption,
        onFieldSubmitted: (newValue) {
          if (newValue!.isNotEmpty) {
            context
                .read<FetchRecipeByQueryCubit>()
                .fetchRecipeByQuery(query: newValue);
          }
        },
        onChanged: (query) {
          if (query!.isNotEmpty) {
            suggestionCubit.startTyping();
            suggestionCubit.fetchSuggestions(query: query);
          } else {
            suggestionCubit.stopTyping();
          }
        },
      ),

      //  const ResentSearchList(),
    );
  }
}
