import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recpie_app/features/Library/presentation/manager/manage_collections_cubit/manage_collections_state.dart';

import '../../../../../core/Views/widgets/custom_image.dart';
import '../../../../../core/data/models/user_model/small_recipe_model.dart';
import '../../../../../core/styles/fonts.dart';
import '../../manager/manage_collections_cubit/manage_collections_cubit.dart';

class SelectRecipeBuilder extends StatelessWidget {
  const SelectRecipeBuilder({
    super.key,
    required this.recipe,
    required this.aspectRatio,
  });

  final SmallRecipeModel recipe;
  final double aspectRatio;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ManageCollectionsCubit, ManageCollectionsState>(
      builder: (context, state) {
        var cubit = context.read<ManageCollectionsCubit>();
        final isSelected = cubit.isSelected(recipe: recipe);
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
                  Positioned(
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
                    ),
                  ),
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
      },
    );
  }
}
