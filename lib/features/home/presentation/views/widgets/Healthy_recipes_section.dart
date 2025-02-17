import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recpie_app/features/home/presentation/views/widgets/recipes_list_view.dart';

import '../../../../../core/Views/widgets/skeletonized_home_recipes.dart';
import '../../manager/healthy_recipes_cubit/healthy_recipes_cubit.dart';

class HealthyRecipesSection extends StatelessWidget {
  const HealthyRecipesSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HealthyRecipesCubit, HealthyRecipesState>(
        builder: (context, state) {
      if (state is HealthyRecipesSuccess) {
        return HomeRecipesListView(
          recipes: state.recipes,
          title: 'Healthy Recipes',
        );
      } else if (state is HealthyRecipesFailure) {
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
