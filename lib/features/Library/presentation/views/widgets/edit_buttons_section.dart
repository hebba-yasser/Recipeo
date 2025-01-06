import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recpie_app/features/Library/presentation/manager/manage_collections_cubit/manage_collections_state.dart';

import '../../../../../core/Views/widgets/custom_button.dart';
import '../../../../../core/styles/fonts.dart';
import '../../../../../core/utils/functions/custom_show_dialog.dart';
import '../../../../../core/utils/functions/custom_show_toast.dart';
import '../../manager/manage_collections_cubit/manage_collections_cubit.dart';
import 'move_to_collection_sheet_body.dart';

class EditButtonsSection extends StatelessWidget {
  const EditButtonsSection({
    super.key,
    required this.collectionId,
  });

  final String collectionId;

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<ManageCollectionsCubit>();
    return BlocConsumer<ManageCollectionsCubit, ManageCollectionsState>(
      listener: (context, state) {
        if (state is RemoveRecipesFromCollectionSuccess) {
          cubit.toggleEdit();
          customShowToast('Recipe Removed successfully');
        }
        if (state is RemoveRecipesFromCollectionFailure) {
          customShowToast('Error while removing Recipe :${state.errMessage}');
        }
      },
      builder: (context, state) {
        final bool isDisabled = cubit.selectedRecipes.isEmpty;
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 5),
              child: Text(
                '${cubit.selectedRecipes.length} Selected',
                style: AppFonts.caption,
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10),
              child: Row(
                children: [
                  Expanded(
                    child: CustomButton(
                      text: 'Move',
                      isButtonDisabled: isDisabled,
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          isDismissible: false,
                          isScrollControlled: true,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(20),
                              topLeft: Radius.circular(20),
                            ),
                          ),
                          builder: (contextt) {
                            return BlocProvider.value(
                              value: context.read<ManageCollectionsCubit>(),
                              child: MoveToCollectionSheetBody(
                                currentId: collectionId,
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: CustomButton(
                      text: 'Remove',
                      onPressed: () async {
                        customShowDialog(
                          context: context,
                          title: 'Remove Recipes?',
                          description:
                              'Are you sure you want to remove recipes from collection?it will remain in your Favourite ',
                          titleButton2: 'Remove',
                          titleButton1: 'Cancel',
                          onPressed2: () async {
                            Navigator.pop(context);
                            await cubit.removeRecipesFromCollections(
                                collectionId: collectionId);
                          },
                          onPressed1: () {
                            Navigator.pop(context);
                          },
                        );
                      },
                      isButtonDisabled: isDisabled,
                    ),
                  )
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
