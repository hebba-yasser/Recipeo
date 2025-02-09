import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recpie_app/core/Views/widgets/custom_circle_button.dart';
import 'package:recpie_app/core/data/models/user_model/collections_model.dart';
import 'package:recpie_app/core/styles/colors.dart';
import 'package:recpie_app/core/utils/functions/custom_show_dialog.dart';
import 'package:recpie_app/core/utils/functions/custom_show_toast.dart';

import '../../../../../constants.dart';
import '../../../../../core/Views/widgets/custom_back_button.dart';
import '../../../../../core/Views/widgets/custom_text_button.dart';
import '../../../../../core/styles/fonts.dart';
import '../../manager/fetch_recipes_of_collection_cubit/fetch_recipes_of_collection_cubit.dart';
import '../../manager/manage_collections_cubit/manage_collections_cubit.dart';
import '../../manager/manage_collections_cubit/manage_collections_state.dart';

class CollectionRecipesAppBar extends StatelessWidget {
  const CollectionRecipesAppBar({
    super.key,
    required this.collection,
  });

  final CollectionModel collection;

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<ManageCollectionsCubit>();
    return BlocConsumer<ManageCollectionsCubit, ManageCollectionsState>(
      listener: (context, state) {
        if (state is DeleteCollectionsSuccess) {
          Navigator.pop(context);
          customShowToast('Collection Deleted Successfully');
        }
        if (state is DeleteCollectionsFailure) {
          customShowToast(state.errMessage);
        }
      },
      builder: (context, state) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Row(
          children: [
            const CustomBackButton(),
            const Spacer(),
            CustomCircleButton(
                onPressed: () async {
                  customShowDialog(
                    context: context,
                    title: 'Delete Collection?',
                    description:
                        'Are you sure you want to delete collection with all saved data ',
                    titleButton2: 'Delete',
                    titleButton1: 'Cancel',
                    onPressed2: () async {
                      Navigator.pop(context);
                      await context
                          .read<FetchRecipesOfCollectionCubit>()
                          .close();
                      await cubit.deleteCollections(collection: collection);
                    },
                    onPressed1: () {
                      Navigator.pop(context);
                    },
                  );
                },
                icon: Icons.delete,
                backgroundColor: kprimaryColor,
                clickColor: AppColors.lightPeach,
                iconColor: Colors.white),
            const SizedBox(
              width: 10,
            ),
            CustomCircleButton(
                onPressed: () {
                  cubit.toggleEdit();
                },
                icon: Icons.edit_note,
                backgroundColor: kprimaryColor,
                clickColor: AppColors.lightPeach,
                iconColor: Colors.white),
            cubit.isEditable
                ? CustomTextButton(
                    text: 'Cancel',
                    style: AppFonts.bodyText16.copyWith(
                      fontWeight: FontWeight.bold,
                      color: kprimaryColor,
                    ),
                    onPressed: () {
                      cubit.toggleEdit();
                    },
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
