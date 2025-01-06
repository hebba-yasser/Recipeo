import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recpie_app/core/utils/service_locator.dart';
import 'package:recpie_app/features/Library/data/repos/library_repos_imp.dart';
import 'package:recpie_app/features/Library/presentation/views/widgets/create_collection_recipes_view_body.dart';

import '../manager/manage_collections_cubit/manage_collections_cubit.dart';

class CreateCollectionRecipesView extends StatelessWidget {
  const CreateCollectionRecipesView({super.key, required this.collectionName});

  final String collectionName;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ManageCollectionsCubit(getIt.get<LibraryReposImp>()),
      child: Scaffold(
        body: CreateCollectionRecipesViewBody(
          collectionName: collectionName,
        ),
      ),
    );
  }
}
