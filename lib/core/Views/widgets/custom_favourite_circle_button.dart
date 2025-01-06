import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recpie_app/core/cubits/update_favourites_cubit/update_favourites_cubit.dart';
import 'package:recpie_app/core/cubits/update_favourites_cubit/update_favourites_state.dart';
import 'package:recpie_app/core/data/models/user_model/small_recipe_model.dart';
import 'package:recpie_app/core/utils/functions/custom_show_toast.dart';

import '../../../constants.dart';
import '../../cubits/user_data_cubit/user_data_cubit.dart';
import '../../cubits/user_data_cubit/user_data_state.dart';
import '../../styles/colors.dart';
import 'custom_circle_button.dart';

class CustomFavouriteCircleButton extends StatelessWidget {
  const CustomFavouriteCircleButton({
    super.key,
    required this.recipe,
  });

  final SmallRecipeModel recipe;

  @override
  // Widget build(BuildContext context) {
  //   bool isLiked;
  //   return BlocConsumer<UserDataCubit, UserDataState>(
  //     listener: (context, state) {
  //       if (state is UserDataFailure) {
  //         customShowToast(state.errMessage);
  //         print(state.errMessage);
  //       }
  //       if (state is UserDataSuccess) {
  //         isLiked = state.user.likedRecipes
  //                 ?.any((likedRecipe) => likedRecipe.id == recipe.id) ??
  //             false;
  //       }
  //     },
  //     builder: (userContext, userState) {
  //       print('ibuild');
  //       isLiked = userState is UserDataSuccess
  //           ? userState.user.likedRecipes
  //                   ?.any((likedRecipe) => likedRecipe.id == recipe.id) ??
  //               false
  //           : false;
  //       return CustomCircleButton(
  //         onPressed: () {
  //           BlocProvider.of<UpdateFavouritesCubit>(context)
  //               .updateFavourites(recipe: recipe);
  //         },
  //         icon: Icons.favorite,
  //         backgroundColor: Colors.white,
  //         clickColor: AppColors.lightPeach,
  //         iconColor: isLiked ? kprimaryColor : Colors.grey,
  //         radius: 20,
  //       );
  //     },
  //   );
  // }

  Widget build(BuildContext context) {
    return BlocListener<UpdateFavouritesCubit, UpdateFavouritesState>(
      listener: (context, state) {
        if (state is UpdateFavouritesSuccess) {
          customShowToast('Add to Favourites');
        }
      },
      child: BlocBuilder<UserDataCubit, UserDataState>(
        builder: (context, userState) {
          bool isLiked = false;
          if (userState is UserDataSuccess) {
            isLiked = userState.user.likedRecipes
                    ?.any((likedRecipe) => likedRecipe.id == recipe.id) ??
                false;
          }
          return CustomCircleButton(
            onPressed: () {
              BlocProvider.of<UpdateFavouritesCubit>(context)
                  .updateFavourites(recipe: recipe);
            },
            icon: Icons.favorite,
            backgroundColor: Colors.white,
            clickColor: AppColors.lightPeach,
            iconColor: isLiked ? kprimaryColor : Colors.grey,
            radius: 20,
          );
        },
      ),
    );
  }
}
