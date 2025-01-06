import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recpie_app/constants.dart';

import '../../../../../core/Views/widgets/custom_divider.dart';
import '../../../../../core/Views/widgets/custom_image.dart';
import '../../../../../core/styles/fonts.dart';
import '../../../../../core/utils/functions/custom_show_toast.dart';
import '../../manager/fetch_collections_cubit/fetch_collections_cubit.dart';
import '../../manager/manage_collections_cubit/manage_collections_cubit.dart';
import '../../manager/manage_collections_cubit/manage_collections_state.dart';
import 'library_sheet_app_bar.dart';

class MoveToCollectionSheetBody extends StatelessWidget {
  const MoveToCollectionSheetBody({
    super.key,
    required this.currentId,
  });

  final String currentId;

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<ManageCollectionsCubit>();
    var collection = context.read<FetchCollectionsCubit>().collectionList;
    collection.removeWhere(
      (element) => element.collectionId == currentId,
    );

    return BlocConsumer<ManageCollectionsCubit, ManageCollectionsState>(
      listener: (context, state) {
        if (state is MoveRecipesSuccess) {
          Navigator.pop(context);
          cubit.toggleEdit();
          customShowToast('Moved Successfully');
        }
        if (state is MoveRecipesFailure) {
          customShowToast(state.errMessage);
        }
      },
      builder: (context, state) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          LibrarySheetAppBar(
            onPressed: () {
              Navigator.pop(context);
            },
            title: 'Move To Collection',
          ),
          const CustomDivider(),
          const SizedBox(height: 15),
          (state is MoveRecipesLoading)
              ? LinearProgressIndicator(
                  color: kprimaryColor,
                  backgroundColor: Colors.white,
                )
              : SizedBox(),
          Container(
            constraints: BoxConstraints(
                minHeight: 0,
                maxHeight: MediaQuery.of(context).size.height * .6),
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: collection.length,
              itemBuilder: (context, index) => ListTile(
                onTap: () async {
                  await cubit.moveRecipe(
                      newCollectionId: collection[index].collectionId!,
                      removeCollectionId: currentId,
                      recipesList: cubit.selectedRecipes);
                },
                leading: ConditionalBuilder(
                  condition: collection[index].recipes!.isEmpty,
                  builder: (context) => AspectRatio(
                    aspectRatio: 2.4 / 2.4,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.grey.shade100,
                              Colors.grey.shade400,
                            ]),
                      ),
                    ),
                  ),
                  fallback: (context) => CustomImage(
                    imgUrl: collection[index].recipes?[0].image ?? '',
                    aspectRatio: 2.4 / 2.4,
                  ),
                ),
                title: Text(
                  collection[index].collectionName,
                  style:
                      AppFonts.bodyText16.copyWith(fontWeight: FontWeight.w500),
                ),
                subtitle: Text(
                  '${collection[index].recipes?.length} recipes',
                  style: AppFonts.bodyText14,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
