import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recpie_app/core/utils/service_locator.dart';
import 'package:recpie_app/features/Library/data/repos/library_repos_imp.dart';
import 'package:recpie_app/features/Library/presentation/manager/fetch_fav_recipe_by_id_cubit/fetch_fav_recipe_by_id_cubit.dart';
import 'package:recpie_app/features/Library/presentation/views/widgets/Library_tap_bar.dart';
import 'package:recpie_app/features/Library/presentation/views/widgets/library_content_secton.dart';
import 'package:recpie_app/features/Library/presentation/views/widgets/library_heade.dart';

class LibraryViewBody extends StatefulWidget {
  const LibraryViewBody({super.key});

  @override
  State<LibraryViewBody> createState() => _LibraryViewBodyState();
}

class _LibraryViewBodyState extends State<LibraryViewBody>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);

    // Listen to tab changes
    tabController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              FetchFavRecipeByIdCubit(getIt.get<LibraryReposImp>()),
        )
      ],
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const LibraryHeader(),
            const SizedBox(
              height: 15,
            ),
            LibraryTapBar(tabController: tabController),
            const SizedBox(
              height: 20,
            ),
            LibraryContentSection(tabController: tabController),
          ],
        ),
      ),
    );
  }
}
