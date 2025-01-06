import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recpie_app/core/cubits/user_data_cubit/user_data_cubit.dart';
import 'package:recpie_app/core/cubits/user_data_cubit/user_data_state.dart';
import 'package:recpie_app/core/utils/functions/custom_loading_indicator.dart';
import 'package:recpie_app/features/Library/presentation/views/widgets/select_recipe_builder.dart';

import '../../../../../core/Views/widgets/custom_empty_screen.dart';
import 'create_recipes_app_bar.dart';

class CreateCollectionRecipesViewBody extends StatelessWidget {
  const CreateCollectionRecipesViewBody(
      {super.key, required this.collectionName});

  final String collectionName;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserDataCubit, UserDataState>(
      builder: (context, state) {
        if (state is UserDataSuccess) {
          final likedRecipes = state.user.likedRecipes;
          return SafeArea(
            child: Column(
              children: [
                CreateRecipesAppBar(
                  collectionName: collectionName,
                ),
                ConditionalBuilder(
                  condition: likedRecipes == null || likedRecipes.isEmpty,
                  builder: (context) => const Expanded(
                    child: CustomEmptyScreen(
                      icon: CupertinoIcons.heart_slash_fill,
                      title: 'No Recipes in Liked',
                      subTitle:
                          'Recipes you add to favourites will appear here',
                    ),
                  ),
                  fallback: (context) => Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          childAspectRatio: 2.2 / 4,
                          crossAxisCount: 3,
                          crossAxisSpacing: 5,
                          mainAxisSpacing: 5,
                        ),
                        itemCount: likedRecipes?.length,
                        itemBuilder: (context, index) {
                          return SelectRecipeBuilder(
                            recipe: likedRecipes![index],
                            aspectRatio: 2 / 2,
                          );
                        },
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        } else if (state is UserDataFailure) {
          return Text('errorrr');
        } else {
          return customLoadingIndicator();
        }
      },
    );
  }
}
