import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recpie_app/features/home/presentation/views/widgets/recipes_list_view.dart';

import '../../../../../core/utils/functions/custom_loading_indicator.dart';
import '../../manager/fetch_personalized_recipes_cubit/fetch_personalized_recipes_cubit.dart';
import '../../manager/fetch_personalized_recipes_cubit/fetch_personalized_recipes_state.dart';

class PersonalizedListener extends StatelessWidget {
  const PersonalizedListener({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchPersonalizedRecipesCubit,
        FetchPersonalizedRecipesState>(builder: (context, state) {
      if (state is PersonalizedRecipesSuccess) {
        if (state.recipes.isNotEmpty) {
          return HomeRecipesListView(
            recipes: state.recipes,
            title: 'Just For you',
          );
        } else {
          return const SizedBox();
        }
      } else if (state is PersonalizedRecipesFailure) {
        return Center(
          child: Text(
            state.errMessage,
            textAlign: TextAlign.center,
          ),
        );
      } else if (state is PersonalizedRecipesLoading) {
        return customLoadingIndicator();
      } else {
        return const SizedBox();
      }
    });
  }
}
