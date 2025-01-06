import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/Views/recipe_details_view.dart';
import '../../../../../core/Views/widgets/square_recpie_item.dart';
import '../../../../../core/data/models/user_model/small_recipe_model.dart';
import '../../../../../core/utils/functions/Navigaor_push.dart';
import '../../../../../core/utils/functions/custom_show_toast.dart';
import '../../manager/fetch_fav_recipe_by_id_cubit/fetch_fav_recipe_by_id__state.dart';
import '../../manager/fetch_fav_recipe_by_id_cubit/fetch_fav_recipe_by_id_cubit.dart';

class LikedGridview extends StatelessWidget {
  const LikedGridview({
    super.key,
    required this.likedRecipes,
  });

  final List<SmallRecipeModel>? likedRecipes;

  @override
  Widget build(BuildContext context) {
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
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 2 / 3,
            crossAxisCount: 2,
            crossAxisSpacing: 5,
            mainAxisSpacing: 5,
          ),
          itemCount: likedRecipes?.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                context
                    .read<FetchFavRecipeByIdCubit>()
                    .fetchRecipeById(id: likedRecipes?[index].id ?? 0);
              },
              child: SquareRecipeItem(
                model: likedRecipes?[index],
                aspectRatio: 2.4 / 2.4,
              ),
            );
          },
        ),
      ),
    );
  }
}
