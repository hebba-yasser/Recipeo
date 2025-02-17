import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recpie_app/features/home/presentation/manager/easy_recipes_cubit/easy_recipes_cubit.dart';
import 'package:recpie_app/features/home/presentation/views/widgets/recipes_list_view.dart';

import '../../../../../core/Views/widgets/skeletonized_home_recipes.dart';

class EasyRecipesSection extends StatelessWidget {
  const EasyRecipesSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EasyRecipesCubit, EasyRecipesState>(
        builder: (context, state) {
      if (state is EasyRecipesSuccess) {
        return HomeRecipesListView(
          recipes: state.recipes,
          title: 'Easy Recipes',
        );
      } else if (state is EasyRecipesFailure) {
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
