import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recpie_app/features/home/presentation/views/widgets/recipes_list_view.dart';

import '../../../../../core/Views/widgets/square_recipe_body.dart';
import '../../../../../core/utils/functions/custom_loading_indicator.dart';
import '../../manager/fetch_personalized_recipes_cubit/fetch_personalized_recipes_cubit.dart';
import '../../manager/fetch_personalized_recipes_cubit/fetch_personalized_recipes_state.dart';
import '../../manager/highly_rated_recipes_cubit/highly_rated_recipes_cubit.dart';
import 'circle_category_list_view.dart';
import 'custom_home_app_bar.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              const CustomHomeAppBar(),
              Column(
                children: [
                  //     const PersonalizedListener(),
                  // BlocBuilder<PopularRecipesCubit, PopularRecipesState>(
                  //     builder: (context, state) {
                  //   if (state is PopularRecipesSuccess) {
                  //     return HomeRecipesListView(
                  //       recipes: state.recipes,
                  //       title: 'Popular Recipes',
                  //     );
                  //   } else if (state is PopularRecipesFailure) {
                  //     return Center(
                  //       child: Text(
                  //         state.errMessage,
                  //         textAlign: TextAlign.center,
                  //       ),
                  //     );
                  //   } else {
                  //     return customLoadingIndicator();
                  //   }
                  // }),
                  // Padding(
                  //   padding: const EdgeInsets.symmetric(
                  //       horizontal: 12.0, vertical: 8.0),
                  //   child: CollectionTitle(
                  //     title: 'Categories',
                  //     onPressed: () {
                  //       BlocProvider.of<BottomNavigationCubit>(context)
                  //           .changeBottomNav(3);
                  //     },
                  //   ),
                  // ),
                  const CircleCategoryListView(),
                  // BlocBuilder<HealthyRecipesCubit, HealthyRecipesState>(
                  //     builder: (context, state) {
                  //   if (state is HealthyRecipesSuccess) {
                  //     return HomeRecipesListView(
                  //       recipes: state.recipes,
                  //       title: 'Healthy Recipes',
                  //     );
                  //   } else if (state is HealthyRecipesFailure) {
                  //     return Center(
                  //       child: Text(
                  //         state.errMessage,
                  //         textAlign: TextAlign.center,
                  //       ),
                  //     );
                  //   } else {
                  //     return customLoadingIndicator();
                  //   }
                  // }),
                  BlocBuilder<HighlyRatedRecipesCubit, HighlyRatedRecipesState>(
                      builder: (context, state) {
                    if (state is HighlyRatedRecipesSuccess) {
                      return SquareRecipeBody(
                        similarRecipes: state.recipes,
                        title: 'Highly Rated Recipes',
                      );
                    } else if (state is HighlyRatedRecipesFailure) {
                      return Center(
                        child: Text(
                          state.errMessage,
                          textAlign: TextAlign.center,
                        ),
                      );
                    } else {
                      return customLoadingIndicator();
                    }
                  }),
                  // BlocBuilder<EasyRecipesCubit, EasyRecipesState>(
                  //     builder: (context, state) {
                  //   if (state is EasyRecipesSuccess) {
                  //     return HomeRecipesListView(
                  //       recipes: state.recipes,
                  //       title: 'Easy Recipes',
                  //     );
                  //   } else if (state is EasyRecipesFailure) {
                  //     return Center(
                  //       child: Text(
                  //         state.errMessage,
                  //         textAlign: TextAlign.center,
                  //       ),
                  //     );
                  //   } else {
                  //     return customLoadingIndicator();
                  //   }
                  // }),
                ],
              ),
              SizedBox(
                height: 5,
              )
            ],
          ),
        ),
      ],
    );
  }
}

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
