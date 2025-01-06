import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recpie_app/features/Library/presentation/manager/manage_collections_cubit/manage_collections_cubit.dart';

import '../../../../../core/Views/widgets/custom_image.dart';
import '../../../../../core/data/models/user_model/small_recipe_model.dart';
import '../../../../../core/styles/fonts.dart';

class SelectableRecipeItem extends StatelessWidget {
  const SelectableRecipeItem({
    super.key,
    required this.aspectRatio,
    required this.recipe,
    required this.isSelected,
  });

  final double aspectRatio;
  final SmallRecipeModel recipe;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    var cubit = context.read<ManageCollectionsCubit>();
    return SizedBox(
      width: 150,
      height: 300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              CustomImage(
                aspectRatio: aspectRatio,
                imgUrl: recipe.image ?? '',
              ),
              cubit.isEditable
                  ? Positioned(
                      top: 0,
                      right: 0,
                      child: IconButton(
                        padding: const EdgeInsets.all(0),
                        iconSize: 35,
                        onPressed: () {
                          cubit.toggleSelectedRecipe(recipe: recipe);
                        },
                        icon: Icon(
                          isSelected
                              ? Icons.check_circle
                              : Icons.radio_button_unchecked,
                          color: Colors.white,
                        ),
                      ))
                  : const SizedBox(),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Text(
                    recipe.title ?? '',
                    style: AppFonts.bodyText16,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    // Ellipsis for overflow
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
