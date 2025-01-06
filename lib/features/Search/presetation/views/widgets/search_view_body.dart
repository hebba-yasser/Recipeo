import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recpie_app/features/Search/presetation/manager/update_recent_search_cubit/update_recent_search_cubit.dart';
import 'package:recpie_app/features/Search/presetation/views/widgets/filter_container.dart';
import 'package:recpie_app/features/Search/presetation/views/widgets/recipe_by_query_listener.dart';
import 'package:recpie_app/features/Search/presetation/views/widgets/suggestions_display.dart';

import '../../../../../core/utils/service_locator.dart';
import '../../../data/repos/search_repos_imp.dart';
import '../../manager/fetch_recipes_by_id_cubit/fetch_recipe_by_id_cubit.dart';
import '../../manager/fetch_recipes_by_query_cubit/fetch_recipe_by_query_cubit.dart';
import '../../manager/suggestion_cubit/suggestions_cubit.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SuggestionsCubit(getIt.get<SearchReposImp>()),
        ),
        BlocProvider(
          create: (context) => UpdateRecentSearchCubit(
            getIt.get<SearchReposImp>(),
          ),
        ),
        BlocProvider(
          create: (context) => FetchRecipeByIdCubit(getIt.get<SearchReposImp>(),
              context.read<UpdateRecentSearchCubit>()),
        ),
        BlocProvider(
          create: (context) => FetchRecipeByQueryCubit(
              getIt.get<SearchReposImp>(),
              context.read<UpdateRecentSearchCubit>()),
        ),
      ],
      child: const SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              child: RecipeByQueryListener(),
            ),
            Expanded(
              child: SuggestionsDisplay(),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: FilterContainer(),
            )
          ],
        ),
      ),
    );
  }
}
