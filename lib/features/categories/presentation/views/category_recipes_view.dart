import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recpie_app/core/Views/widgets/no_data_view_body.dart';
import 'package:recpie_app/core/Views/widgets/recipes_view_list.dart';
import 'package:recpie_app/core/utils/functions/custom_loading_indicator.dart';
import 'package:recpie_app/core/utils/service_locator.dart';
import 'package:recpie_app/features/categories/presentation/manager/recipes_by_category_cubit/recipes_by_category_cubit.dart';

import '../../../../core/Views/widgets/custom_app_bar.dart';
import '../../data/repos/categories_repos_imp.dart';

class CategoryRecipesView extends StatelessWidget {
  const CategoryRecipesView({
    super.key,
    required this.subCategoryName,
    required this.categoryName,
  });

  final String subCategoryName;
  final String categoryName;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RecipesByCategoryCubit(getIt.get<CategoryReposImp>())
        ..fetchRecipesByCategory(categoryName, subCategoryName),
      child: Scaffold(
        body: BlocBuilder<RecipesByCategoryCubit, RecipesByCategoryState>(
          builder: (context, state) {
            if (state is RecipesByCategorySuccess) {
              return SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 12.0, vertical: 12),
                  child: Column(
                    children: [
                      CustomAppBar(title: subCategoryName),
                      ConditionalBuilder(
                        condition: state.recipes.isEmpty,
                        builder: (context) => const NoDataViewBody(),
                        fallback: (context) => RecipesListView(
                          recipes: state.recipes,
                        ),
                      )
                    ],
                  ),
                ),
              );
            } else if (state is RecipesByCategoryFailure) {
              return Center(
                child: Text(
                  state.errMessage,
                  textAlign: TextAlign.center,
                ),
              );
            } else {
              return customLoadingIndicator();
            }
          },
        ),
      ),
    );
  }
}
