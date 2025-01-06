import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recpie_app/features/Library/presentation/views/widgets/select_recipe_builder.dart';
import 'package:recpie_app/features/Library/presentation/views/widgets/update_recipes_app_bar.dart';

import '../../../../../core/Views/widgets/custom_empty_screen.dart';
import '../../../../../core/cubits/user_data_cubit/user_data_cubit.dart';
import '../../../../../core/cubits/user_data_cubit/user_data_state.dart';
import '../../../../../core/data/models/user_model/collections_model.dart';
import '../../../../../core/utils/functions/custom_loading_indicator.dart';
import '../../manager/manage_collections_cubit/manage_collections_cubit.dart';

class SelectRecipesViewBody extends StatelessWidget {
  const SelectRecipesViewBody({super.key, required this.collectionModel});
  final CollectionModel collectionModel;

  @override
  Widget build(BuildContext context) {
    context.read<ManageCollectionsCubit>().selectedRecipes =
        collectionModel.recipes!;
    return BlocBuilder<UserDataCubit, UserDataState>(
      builder: (context, state) {
        if (state is UserDataSuccess) {
          final likedRecipes = state.user.likedRecipes;
          return SafeArea(
            child: Column(
              children: [
                UpdateRecipesAppBar(
                  collectionModel: collectionModel,
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
