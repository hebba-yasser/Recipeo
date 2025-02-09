import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recpie_app/core/utils/functions/custom_loading_indicator.dart';
import 'package:recpie_app/core/utils/service_locator.dart';
import 'package:recpie_app/features/Library/data/repos/library_repos_imp.dart';
import 'package:recpie_app/features/Library/presentation/manager/fetch_recipes_of_collection_cubit/fetch_recipes_of_collection_cubit.dart';
import 'package:recpie_app/features/Library/presentation/manager/fetch_recipes_of_collection_cubit/fetch_recipes_of_collection_state.dart';
import 'package:recpie_app/features/Library/presentation/manager/manage_collections_cubit/manage_collections_cubit.dart';
import 'package:recpie_app/features/Library/presentation/views/widgets/collection_recipes_view_body.dart';

import '../manager/fetch_collections_cubit/fetch_collections_cubit.dart';
import '../manager/fetch_fav_recipe_by_id_cubit/fetch_fav_recipe_by_id_cubit.dart';

class CollectionRecipesView extends StatelessWidget {
  const CollectionRecipesView({
    super.key,
    required this.collectionId,
    //   required this.value
  });

  final String collectionId;
  // final FetchCollectionsCubit value;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              FetchRecipesOfCollectionCubit(getIt.get<LibraryReposImp>())
                ..fetchRecipesOfCollection(collectionId: collectionId),
        ),
        BlocProvider(
          create: (context) =>
              FetchFavRecipeByIdCubit(getIt.get<LibraryReposImp>()),
        ),
        BlocProvider(
          create: (context) => ManageCollectionsCubit(
            getIt.get<LibraryReposImp>(),
            context.read<FetchCollectionsCubit>(),
          ),
        ),
      ],
      child: Scaffold(
        body: BlocConsumer<FetchRecipesOfCollectionCubit,
            FetchRecipesOfCollectionState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is FetchRecipesOfCollectionFailure) {
              return Center(
                child: Text(
                  state.errMessage,
                  style: const TextStyle(color: Colors.red),
                ),
              );
            } else if (state is FetchRecipesOfCollectionSuccess) {
              return CollectionRecipesViewBody(
                collectionModel: state.recipes,
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
