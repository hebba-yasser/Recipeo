import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recpie_app/features/Search/presetation/views/widgets/search_field_form.dart';

import '../../../../../constants.dart';
import '../../../../../core/Views/recipes_view.dart';
import '../../../../../core/utils/functions/Navigaor_push.dart';
import '../../../../../core/utils/functions/custom_show_toast.dart';
import '../../manager/fetch_recipes_by_query_cubit/fetch_recipe_by_query_cubit.dart';
import '../../manager/fetch_recipes_by_query_cubit/fetch_recipe_by_query_state.dart';
import '../../manager/suggestion_cubit/suggestions_cubit.dart';

class RecipeByQueryListener extends StatefulWidget {
  const RecipeByQueryListener({
    super.key,
  });

  @override
  State<RecipeByQueryListener> createState() => _RecipeByQueryListenerState();
}

class _RecipeByQueryListenerState extends State<RecipeByQueryListener> {
  final GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final suggestionCubit = context.read<SuggestionsCubit>();
    return BlocConsumer<FetchRecipeByQueryCubit, FetchRecipeByQueryState>(
        listener: (context, state) {
      if (state is FetchRecipeByQuerySuccess) {
        navigatorPush(
          context,
          RecipesView(
            title: 'Search Results',
            recipes: state.recipe,
          ),
        );
        context.read<SuggestionsCubit>().controller.clear();
        context.read<SuggestionsCubit>().stopTyping();
        FocusScope.of(context).requestFocus(FocusNode());
      } else if (state is FetchRecipeByQueryFailure) {
        return customShowToast(state.errMessage);
      }
    }, builder: (context, state) {
      return Column(
        children: [
          SearchFieldForm(formKey: formKey, suggestionCubit: suggestionCubit),
          if (state is FetchRecipeByQueryLoading)
            const LinearProgressIndicator(
              backgroundColor: kprimaryColor,
            ),
        ],
      );
    });
  }
}
