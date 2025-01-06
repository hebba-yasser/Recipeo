import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recpie_app/core/cubits/user_data_cubit/user_data_cubit.dart';
import 'package:recpie_app/core/cubits/user_data_cubit/user_data_state.dart';
import 'package:recpie_app/core/utils/functions/custom_loading_indicator.dart';

import '../../../../../core/Views/widgets/custom_empty_screen.dart';
import 'liked_gridview.dart';

// class LikedSection extends StatelessWidget {
//   const LikedSection({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<UserDataCubit, UserDataState>(
//       builder: (context, userState) {
//         if (userState is UserDataSuccess) {
//           return Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 12.0),
//             child: GridView.builder(
//               gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                 childAspectRatio: 2.2 / 3,
//                 crossAxisCount: 2, // Specify number of columns
//                 crossAxisSpacing: 5, // Space between columns
//                 mainAxisSpacing: 5,
//               ),
//               itemBuilder: (context, index) => BlocListener<
//                   FetchFavRecipeByIdCubit, FetchFavRecipeByIdState>(
//                 listener: (context, recipeState) {
//                   if (recipeState is FetchFavRecipeByIdSuccess) {
//                     navigatorPush(
//                       context,
//                       RecipeDetailsView(recipeModel: recipeState.recipe),
//                     );
//                   } else if (recipeState is FetchFavRecipeByIdFailure) {
//                     customShowToast(recipeState.errMessage);
//                   }
//                 },
//                 child: GestureDetector(
//                   onTap: () async {
//                     await context
//                         .read<FetchFavRecipeByIdCubit>()
//                         .fetchRecipeById(
//                             id: userState.user.likedRecipes?[index].id ?? 0);
//                   },
//                   child: SquareRecipeItem(
//                       model: userState.user.likedRecipes?[index],
//                       aspectRatio: 2.4 / 2.4),
//                 ),
//               ),
//               itemCount: userState.user.likedRecipes?.length,
//             ),
//           );
//         } else if (userState is UserDataFailure) {
//           return Text(userState.errMessage);
//         } else {
//           return customLoadingIndicator();
//         }
//       },
//     );
//   }
// }
// class LikedSection extends StatelessWidget {
//   const LikedSection({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<UserDataCubit, UserDataState>(
//       builder: (context, userState) {
//         if (userState is UserDataSuccess) {
//           final likedRecipes = userState.user.likedRecipes;
//           if (likedRecipes == null || likedRecipes.isEmpty) {
//             return const Center(child: Text('No liked recipes found.'));
//           }
//           return Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 12.0),
//             child: GridView.builder(
//               gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                 childAspectRatio: 2.2 / 3,
//                 crossAxisCount: 2, // Number of columns
//                 crossAxisSpacing: 5, // Space between columns
//                 mainAxisSpacing: 5, // Space between rows
//               ),
//               itemCount: likedRecipes.length,
//               itemBuilder: (context, index) {
//                 final recipe = likedRecipes[index];
//                 return GestureDetector(
//                   onTap: () async {
//                     final cubit = context.read<FetchFavRecipeByIdCubit>();
//                     await cubit.fetchRecipeById(id: recipe.id ?? 0);
//
//                     final recipeState = cubit.state;
//                     if (recipeState is FetchFavRecipeByIdSuccess) {
//                       navigatorPush(
//                         context,
//                         RecipeDetailsView(recipeModel: recipeState.recipe),
//                       );
//                     } else if (recipeState is FetchFavRecipeByIdFailure) {
//                       customShowToast(recipeState.errMessage);
//                     }
//                   },
//                   child: SquareRecipeItem(
//                     model: recipe,
//                     aspectRatio: 2.4 / 2.4,
//                   ),
//                 );
//               },
//             ),
//           );
//         } else if (userState is UserDataFailure) {
//           return Center(
//             child: Text(
//               userState.errMessage,
//               style: const TextStyle(color: Colors.red),
//             ),
//           );
//         } else {
//           return Center(child: customLoadingIndicator());
//         }
//       },
//     );
//   }
// }
class LikedSection extends StatelessWidget {
  const LikedSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserDataCubit, UserDataState>(
      builder: (context, userState) {
        if (userState is UserDataSuccess) {
          final likedRecipes = userState.user.likedRecipes;
          if (likedRecipes == null || likedRecipes.isEmpty) {
            return const CustomEmptyScreen(
              icon: CupertinoIcons.heart_slash_fill,
              title: 'No Recipes is Liked',
              subTitle: '',
            );
          }
          return LikedGridview(likedRecipes: userState.user.likedRecipes);
        } else if (userState is UserDataFailure) {
          return Center(
            child: Text(
              userState.errMessage,
              style: const TextStyle(color: Colors.red),
            ),
          );
        } else {
          return Center(child: customLoadingIndicator());
        }
      },
    );
  }
}
