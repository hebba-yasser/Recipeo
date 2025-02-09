import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recpie_app/core/data/models/user_model/collections_model.dart';
import 'package:recpie_app/core/utils/service_locator.dart';
import 'package:recpie_app/features/Library/data/repos/library_repos_imp.dart';
import 'package:recpie_app/features/Library/presentation/views/widgets/select_recipes_view_body.dart';

import '../manager/fetch_collections_cubit/fetch_collections_cubit.dart';
import '../manager/manage_collections_cubit/manage_collections_cubit.dart';

class SelectRecipesView extends StatelessWidget {
  const SelectRecipesView({
    super.key,
    required this.collectionModel,
  });

  final CollectionModel collectionModel;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ManageCollectionsCubit>(
      create: (context) => ManageCollectionsCubit(
        getIt.get<LibraryReposImp>(),
        context.read<FetchCollectionsCubit>(),
      ),
      child: Scaffold(
        body: SelectRecipesViewBody(
          collectionModel: collectionModel,
        ),
      ),
    );
  }
}
