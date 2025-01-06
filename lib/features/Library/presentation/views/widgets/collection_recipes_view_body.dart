import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recpie_app/core/styles/fonts.dart';
import 'package:recpie_app/features/Library/presentation/manager/manage_collections_cubit/manage_collections_cubit.dart';
import 'package:recpie_app/features/Library/presentation/manager/manage_collections_cubit/manage_collections_state.dart';
import 'package:recpie_app/features/Library/presentation/views/widgets/select_recipe_grid_view.dart';

import '../../../../../core/data/models/user_model/collections_model.dart';
import 'collection_recipes_app_bar.dart';
import 'edit_buttons_section.dart';
import 'edit_row_section.dart';

class CollectionRecipesViewBody extends StatelessWidget {
  const CollectionRecipesViewBody({super.key, required this.collectionModel});

  final CollectionModel collectionModel;

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<ManageCollectionsCubit>();
    return BlocBuilder<ManageCollectionsCubit, ManageCollectionsState>(
      builder: (context, state) {
        return SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CollectionRecipesAppBar(
                collection: collectionModel,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Text(
                  collectionModel.collectionName,
                  style: AppFonts.heading20,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: ConditionalBuilder(
                  condition: collectionModel.recipes!.isEmpty ||
                      collectionModel.recipes?.length == 1,
                  builder: (context) => Text(
                    '${collectionModel.recipes?.length} Recipe',
                    style: AppFonts.caption,
                  ),
                  fallback: (context) => Text(
                    '${collectionModel.recipes?.length} Recipes',
                    style: AppFonts.caption,
                  ),
                ),
              ),
              cubit.isEditable
                  ? EditRowSection(
                      collectionModel: collectionModel,
                    )
                  : const SizedBox(),
              const SizedBox(
                height: 15,
              ),
              SelectRecipeGridView(recipesList: collectionModel.recipes),
              cubit.isEditable
                  ? EditButtonsSection(
                      collectionId: collectionModel.collectionId!,
                    )
                  : const SizedBox(),
            ],
          ),
        );
      },
    );
  }
}
