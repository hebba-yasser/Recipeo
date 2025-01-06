import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../constants.dart';
import '../../../../../core/Views/widgets/custom_circle_button.dart';
import '../../../../../core/Views/widgets/custom_text_button.dart';
import '../../../../../core/data/models/user_model/collections_model.dart';
import '../../../../../core/styles/colors.dart';
import '../../../../../core/styles/fonts.dart';
import '../../../../../core/utils/functions/custom_show_toast.dart';
import '../../manager/manage_collections_cubit/manage_collections_cubit.dart';
import '../../manager/manage_collections_cubit/manage_collections_state.dart';

class UpdateRecipesAppBar extends StatelessWidget {
  const UpdateRecipesAppBar({super.key, required this.collectionModel});
  final CollectionModel collectionModel;

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<ManageCollectionsCubit>();
    return BlocConsumer<ManageCollectionsCubit, ManageCollectionsState>(
      listener: (context, state) {
        if (state is UpdateCollectionsSuccess) {
          cubit.selectedRecipes == [];
          cubit.toggleEdit();
          customShowToast('Collection Updated successfully');
          Navigator.pop(context);
        }
        if (state is UpdateCollectionsFailure) {
          customShowToast(state.errMessage);
        }
      },
      builder: (context, state) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: ListTile(
          minVerticalPadding: 0,
          contentPadding: const EdgeInsets.all(0),
          leading: CustomCircleButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icons.close,
              backgroundColor: kprimaryColor,
              clickColor: AppColors.cream,
              iconColor: Colors.white),
          title: Center(
            child: Text(
              'ADD FROM',
              style: AppFonts.caption,
            ),
          ),
          subtitle: Center(
            child: Text(
              'Liked Recipes',
              style: AppFonts.bodyText18.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          trailing: CustomTextButton(
            text: state is UpdateCollectionsLoading ? 'Saving...' : 'Done',
            style: AppFonts.bodyText18
                .copyWith(color: kprimaryColor, fontWeight: FontWeight.bold),
            onPressed: () {
              cubit.updateCollections(
                  collection: CollectionModel(
                      collectionId: collectionModel.collectionId,
                      createdAt: collectionModel.createdAt,
                      collectionName: collectionModel.collectionName,
                      recipes: cubit.selectedRecipes));
            },
          ),
        ),
      ),
    );
  }
}
