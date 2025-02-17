import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recpie_app/features/home/presentation/views/widgets/recipes_list_view.dart';

import '../../../../../core/Views/widgets/skeletonized_home_recipes.dart';
import '../../manager/popular_recipes_cubit/popular_recipes_cubit.dart';

class PopularRecipesSection extends StatelessWidget {
  const PopularRecipesSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PopularRecipesCubit, PopularRecipesState>(
        builder: (context, state) {
      if (state is PopularRecipesSuccess) {
        return HomeRecipesListView(
          recipes: state.recipes,
          title: 'Popular Recipes',
        );
      } else if (state is PopularRecipesFailure) {
        return Center(
          child: Text(
            state.errMessage,
            textAlign: TextAlign.center,
          ),
        );
      } else {
        return SkeletonizedHomeRecipes();
      }
    });
  }
}
