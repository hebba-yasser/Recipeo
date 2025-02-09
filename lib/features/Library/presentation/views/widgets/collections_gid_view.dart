import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/Views/widgets/custom_empty_screen.dart';
import '../../../../../core/utils/functions/Navigaor_push.dart';
import '../../../../../core/utils/functions/custom_loading_indicator.dart';
import '../../manager/fetch_collections_cubit/fetch_collections_cubit.dart';
import '../../manager/fetch_collections_cubit/fetch_collections_state.dart';
import '../collection_recipes_view.dart';
import 'collection_item.dart';

class CollectionsGidView extends StatelessWidget {
  const CollectionsGidView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchCollectionsCubit, FetchCollectionsState>(
      builder: (context, state) {
        if (state is FetchCollectionsSuccess) {
          if (state.collectionList.isEmpty) {
            return const CustomEmptyScreen(
              icon: Icons.bookmarks_outlined,
              title: 'No Collections found',
              subTitle: '',
            );
          } else {
            return GridView.builder(
              itemCount: state.collectionList.length,
              itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    navigatorPush(
                      context,
                      CollectionRecipesView(
                        collectionId: state.collectionList[index].collectionId!,
                      ),
                    );
                  },
                  child:
                      CollectionItem(collection: state.collectionList[index])),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 2.2 / 3,
                crossAxisCount: 2,
                crossAxisSpacing: 5,
                mainAxisSpacing: 5,
              ),
            );
          }
        } else if (state is FetchCollectionsFailure) {
          return Center(
            child: Text(
              state.errMessage,
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
