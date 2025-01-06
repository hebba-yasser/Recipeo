import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/Views/recipes_view.dart';
import '../../../../../core/Views/widgets/black_search_button.dart';
import '../../../../../core/utils/functions/Navigaor_push.dart';
import '../../../../../core/utils/functions/custom_loading_indicator.dart';
import '../../../../../core/utils/functions/custom_show_toast.dart';
import '../../manager/filter_cubit/filter_cubit.dart';
import '../../manager/search_recipes_cubit/search_recipes_cubit.dart';

class SearchButtonListener extends StatelessWidget {
  const SearchButtonListener({
    super.key,
    required this.filterCubit,
  });

  final FilterCubit filterCubit;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SearchRecipesCubit, SearchRecipesState>(
      listener: (BuildContext context, searchState) {
        if (searchState is SearchRecipesSuccess) {
          if (searchState.recipes.isEmpty) {
            customShowToast('No Results ...try to be more specific');
          } else {
            navigatorPush(
              context,
              RecipesView(
                title: 'Search Results',
                recipes: searchState.recipes,
              ),
            );
            filterCubit.clearALLChips();
          }
        } else if (searchState is SearchRecipesFailure) {
          customShowToast(searchState.errMessage);
        }
      },
      builder: (context, searchState) => ConditionalBuilder(
        condition: searchState is SearchRecipesLoading,
        builder: (context) => customLoadingIndicator(),
        fallback: (context) => CustomBlackButton(
          onPressed: () {
            BlocProvider.of<SearchRecipesCubit>(context).searchRecipes(
              cuisine: filterCubit.selectedCuisines,
              type: filterCubit.selectedDishType,
              diet: filterCubit.selectedDiets,
              intolerances: filterCubit.selectedIntolerance,
              query: filterCubit.query,
              includeIngredients: filterCubit.includedIngredients,
              excludedIngredients: filterCubit.excludedIngredients,
            );
          },
          title: 'Search',
        ),
      ),
    );
  }
}
