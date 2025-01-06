import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recpie_app/features/categories/presentation/views/widgets/categories_section.dart';
import 'package:recpie_app/features/categories/presentation/views/widgets/celebration_section.dart';

import '../../../../core/Views/recipe_details_view.dart';
import '../../../../core/Views/widgets/custom_button.dart';
import '../../../../core/utils/functions/Navigaor_push.dart';
import '../../../../core/utils/functions/custom_show_toast.dart';
import '../../../../core/utils/service_locator.dart';
import '../../data/repos/categories_repos_imp.dart';
import '../manager/confetti_cubit/confetti_cubit.dart';
import '../manager/random_recipe_cubit/random_recipe_cubit.dart';

class CategoriesViewBody extends StatelessWidget {
  const CategoriesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
        child: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => ConfettiCubit(),
            ),
            BlocProvider(
              create: (context) =>
                  RandomRecipeCubit(getIt.get<CategoryReposImp>()),
            ),
          ],
          child: Stack(
            children: [
              const CategoriesSection(),
              const CelebrationSection(),
              Positioned(
                bottom: 0,
                left: 20,
                right: 20,
                child: BlocListener<ConfettiCubit, ConfettiState>(
                  listener: (context, state) {
                    if (state is ConfettiStopped) {
                      BlocProvider.of<RandomRecipeCubit>(context)
                          .fetchRandomRecipe();
                    }
                  },
                  child: BlocListener<RandomRecipeCubit, RandomRecipeState>(
                    listener: (context, state) {
                      if (state is RandomRecipeSuccess) {
                        navigatorPush(
                          context,
                          RecipeDetailsView(recipeModel: state.recipe),
                        );
                      } else if (state is RandomRecipeFailure) {
                        customShowToast(state.errMessage);
                      }
                    },
                    child: Builder(builder: (context) {
                      return CustomButton(
                        text: 'Surprise me',
                        onPressed: () {
                          // Start confetti animation
                          BlocProvider.of<ConfettiCubit>(context)
                              .playConfetti();
                        },
                      );
                    }),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
