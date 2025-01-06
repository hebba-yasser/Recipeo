import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recpie_app/core/data/models/user_model/collections_model.dart';
import 'package:recpie_app/core/utils/functions/custom_show_toast.dart';
import 'package:recpie_app/features/Library/presentation/manager/manage_collections_cubit/manage_collections_state.dart';

import '../../../../../constants.dart';
import '../../../../../core/Views/widgets/custom_circle_button.dart';
import '../../../../../core/Views/widgets/custom_text_button.dart';
import '../../../../../core/styles/colors.dart';
import '../../../../../core/styles/fonts.dart';
import '../../manager/manage_collections_cubit/manage_collections_cubit.dart';

class CreateRecipesAppBar extends StatelessWidget {
  const CreateRecipesAppBar({
    super.key,
    required this.collectionName,
  });

  final String collectionName;

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<ManageCollectionsCubit>();
    return BlocConsumer<ManageCollectionsCubit, ManageCollectionsState>(
      listener: (context, state) {
        if (state is CreateCollectionSuccess) {
          customShowToast('Collection created successfully');
          Navigator.pop(context);
        }
        if (state is CreateCollectionFailure) {
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
            text: state is CreateCollectionLoading ? 'Saving...' : 'Done',
            style: AppFonts.bodyText18
                .copyWith(color: kprimaryColor, fontWeight: FontWeight.bold),
            onPressed: () {
              cubit.createCollection(
                  collection: CollectionModel(
                      collectionName: collectionName,
                      recipes: cubit.selectedRecipes));
            },
          ),
        ),
      ),
    );
  }
}
