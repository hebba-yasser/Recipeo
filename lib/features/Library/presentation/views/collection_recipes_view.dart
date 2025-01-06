import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recpie_app/core/utils/functions/custom_loading_indicator.dart';
import 'package:recpie_app/core/utils/service_locator.dart';
import 'package:recpie_app/features/Library/data/repos/library_repos_imp.dart';
import 'package:recpie_app/features/Library/presentation/manager/fetch_collections_cubit/fetch_collections_cubit.dart';
import 'package:recpie_app/features/Library/presentation/manager/manage_collections_cubit/manage_collections_cubit.dart';
import 'package:recpie_app/features/Library/presentation/views/widgets/collection_recipes_view_body.dart';

import '../manager/fetch_collections_cubit/fetch_collections_state.dart';
import '../manager/fetch_fav_recipe_by_id_cubit/fetch_fav_recipe_by_id_cubit.dart';

class CollectionRecipesView extends StatelessWidget {
  const CollectionRecipesView(
      {super.key, required this.collectionId, required this.value});

  final String collectionId;
  final FetchCollectionsCubit value;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<FetchCollectionsCubit>.value(value: value),
        BlocProvider(
          create: (context) =>
              FetchFavRecipeByIdCubit(getIt.get<LibraryReposImp>()),
        ),
        BlocProvider(
          create: (context) =>
              ManageCollectionsCubit(getIt.get<LibraryReposImp>()),
        ),
      ],
      child: Scaffold(
        body: BlocBuilder<FetchCollectionsCubit, FetchCollectionsState>(
          builder: (context, state) {
            if (state is FetchCollectionsFailure) {
              return Center(
                child: Text(
                  state.errMessage,
                  style: const TextStyle(color: Colors.red),
                ),
              );
            } else if (state is FetchCollectionsSuccess) {
              final updatedCollection = state.collectionList.firstWhere(
                (collection) => collection.collectionId == collectionId,
              );
              return CollectionRecipesViewBody(
                collectionModel:
                    updatedCollection, // Use the updated collection
              );
            } else {
              return customLoadingIndicator();
            }
          },
        ),
      ),
    );
  }
}
