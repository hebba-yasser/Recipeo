import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recpie_app/core/utils/functions/Navigaor_push.dart';
import 'package:recpie_app/features/Library/presentation/views/select_recipes_view.dart';

import '../../../../../core/data/models/user_model/collections_model.dart';
import '../../../../../core/styles/fonts.dart';
import '../../../../../core/utils/functions/custom_show_toast.dart';
import '../../manager/manage_collections_cubit/manage_collections_cubit.dart';
import '../../manager/manage_collections_cubit/manage_collections_state.dart';
import 'edit_collectio_name_body.dart';

class EditRowSection extends StatelessWidget {
  const EditRowSection({
    super.key,
    required this.collectionModel,
  });

  final CollectionModel collectionModel;

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<ManageCollectionsCubit>();
    return BlocConsumer<ManageCollectionsCubit, ManageCollectionsState>(
      listener: (context, state) {
        if (state is UpdateCollectionsSuccess) {
          customShowToast('Collection Name Updated successfully');
          Navigator.pop(context);
        } else if (state is UpdateCollectionsFailure) {
          customShowToast(state.errMessage);
        }
      },
      builder: (context, state) {
        return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
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
                        return EditCollectionNameBody(
                          value: context.read<ManageCollectionsCubit>(),
                          collectionModel: collectionModel,
                        );
                      },
                    );
                  },
                  child: Container(
                    width: 150,
                    height: 30,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.edit),
                        Text(
                          'Change Name',
                          style: AppFonts.bodyText16,
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    navigatorPush(
                        context,
                        SelectRecipesView(
                          collectionModel: collectionModel,
                        ));
                    cubit.toggleEdit();
                    cubit.selectedRecipes = [];
                  },
                  child: Container(
                    width: 150,
                    height: 30,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.add),
                        Text(
                          'Add recipes',
                          style: AppFonts.bodyText16,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ));
      },
    );
  }
}
