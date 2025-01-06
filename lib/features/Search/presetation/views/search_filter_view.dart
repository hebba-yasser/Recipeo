import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recpie_app/features/Search/presetation/manager/update_recent_search_cubit/update_recent_search_cubit.dart';
import 'package:recpie_app/features/Search/presetation/views/widgets/search_filter_view_body.dart';

import '../../../../core/utils/service_locator.dart';
import '../../data/repos/search_repos_imp.dart';
import '../manager/filter_cubit/filter_cubit.dart';
import '../manager/search_recipes_cubit/search_recipes_cubit.dart';

class SearchFilterView extends StatelessWidget {
  const SearchFilterView({super.key, required this.updateRecentSearchCubit});
  final UpdateRecentSearchCubit updateRecentSearchCubit;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FilterCubit(),
        ),
        BlocProvider(
          create: (context) => SearchRecipesCubit(
              getIt.get<SearchReposImp>(), updateRecentSearchCubit),
        ),
      ],
      child: const Scaffold(
        body: SafeArea(child: SearchFilterViewBody()),
      ),
    );
  }
}
