import 'package:flutter/cupertino.dart';

import '../../../../../core/styles/fonts.dart';
import 'category_sliver_list.dart';

class CategoriesSection extends StatelessWidget {
  const CategoriesSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Text(
            'Explore more',
            style: AppFonts.heading20,
          ),
        ),
        const CategorySliverList(),
      ],
    );
  }
}
