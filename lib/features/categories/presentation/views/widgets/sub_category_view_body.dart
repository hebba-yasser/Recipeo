import 'package:flutter/cupertino.dart';
import 'package:recpie_app/features/categories/presentation/views/widgets/sub_category_sliver_list.dart';

import '../../../../../core/Views/widgets/custom_app_bar.dart';
import '../../../../../core/data/models/categories_model/sub_category_model.dart';

class SubCategoryViewBody extends StatelessWidget {
  const SubCategoryViewBody({
    super.key,
    required this.categoryName,
    required this.subCategories,
  });

  final String categoryName;
  final List<SubCategoryModel> subCategories;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomAppBar(title: categoryName),
        SubCategorySliverList(subCategories: subCategories),
      ],
    );
  }
}
