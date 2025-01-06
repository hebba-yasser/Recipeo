import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/Views/recipe_details_view.dart';
import '../../../../../core/utils/functions/Navigaor_push.dart';
import '../../../../../core/utils/functions/custom_show_toast.dart';
import '../../manager/fetch_recipes_by_id_cubit/fetch_recipe_by_id_cubit.dart';
import '../../manager/fetch_recipes_by_id_cubit/fetch_recipe_by_id_state.dart';
import '../../manager/suggestion_cubit/suggestions_cubit.dart';

class RecipeByIdListener extends StatelessWidget {
  const RecipeByIdListener({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocListener<FetchRecipeByIdCubit, FetchRecipeByIdState>(
      listener: (context, recipeState) {
        if (recipeState is FetchRecipeByIdSuccess) {
          navigatorPush(
            context,
            RecipeDetailsView(recipeModel: recipeState.recipe),
          );
          context.read<SuggestionsCubit>().controller.clear();
          context.read<SuggestionsCubit>().stopTyping();
          FocusScope.of(context).requestFocus(FocusNode());
        } else if (recipeState is FetchRecipeByIdFailure) {
          customShowToast(recipeState.errMessage);
        }
      },
      child: child,
    );
  }
}
