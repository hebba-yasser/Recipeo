import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/Views/widgets/collection_title.dart';
import '../../manager/bottom_navigation_cubit/bottom_navigation_cubit.dart';
import 'circle_category_list_view.dart';

class CategoriesRecipesSection extends StatelessWidget {
  const CategoriesRecipesSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
          child: CollectionTitle(
            title: 'Categories',
            onPressed: () {
              BlocProvider.of<BottomNavigationCubit>(context)
                  .changeBottomNav(3);
            },
          ),
        ),
        const CircleCategoryListView(),
      ],
    );
  }
}
