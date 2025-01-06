import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:recpie_app/features/Library/presentation/manager/fetch_fav_recipe_by_id_cubit/fetch_fav_recipe_by_id__state.dart';
import 'package:recpie_app/features/Library/presentation/manager/fetch_fav_recipe_by_id_cubit/fetch_fav_recipe_by_id_cubit.dart';
import 'package:recpie_app/features/Library/presentation/views/widgets/selectable_recipe_item.dart';

import '../../../../../core/Views/recipe_details_view.dart';
import '../../../../../core/Views/widgets/custom_empty_screen.dart';
import '../../../../../core/data/models/user_model/small_recipe_model.dart';
import '../../../../../core/utils/functions/Navigaor_push.dart';
import '../../../../../core/utils/functions/custom_show_toast.dart';
import '../../manager/manage_collections_cubit/manage_collections_cubit.dart';

class SelectRecipeGridView extends StatelessWidget {
  const SelectRecipeGridView({
    super.key,
    required this.recipesList,
  });

  final List<SmallRecipeModel>? recipesList;

  @override
  Widget build(BuildContext context) {
    if (recipesList!.isEmpty) {
      return const Expanded(
        child: CustomEmptyScreen(
          icon: FontAwesomeIcons.bookmark,
          title: 'No Recipes in this collection',
          subTitle: 'Recipes you add from favourites will appear here',
        ),
      );
    } else {
      return BlocListener<FetchFavRecipeByIdCubit, FetchFavRecipeByIdState>(
        listener: (context, state) {
          if (state is FetchFavRecipeByIdSuccess) {
            navigatorPush(
              context,
              RecipeDetailsView(recipeModel: state.recipe),
            );
          } else if (state is FetchFavRecipeByIdFailure) {
            customShowToast(state.errMessage);
          }
        },
        child: Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 2.2 / 3,
                crossAxisCount: 2,
                crossAxisSpacing: 5,
                mainAxisSpacing: 5,
              ),
              itemCount: recipesList?.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    context
                        .read<FetchFavRecipeByIdCubit>()
                        .fetchRecipeById(id: recipesList?[index].id ?? 0);
                  },
                  child: SelectableRecipeItem(
                      aspectRatio: 2.4 / 2.4,
                      recipe: recipesList![index],
                      isSelected: context
                          .read<ManageCollectionsCubit>()
                          .isSelected(recipe: recipesList![index])),
                );
              },
            ),
          ),
        ),
      );
    }
  }
}
