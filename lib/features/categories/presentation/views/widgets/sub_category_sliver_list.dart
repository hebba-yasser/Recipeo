import 'package:flutter/cupertino.dart';
import 'package:recpie_app/core/utils/functions/Navigaor_push.dart';

import '../../../../../core/data/models/categories_model/sub_category_model.dart';
import '../category_recipes_view.dart';
import 'category_item.dart';

class SubCategorySliverList extends StatelessWidget {
  const SubCategorySliverList({
    super.key,
    required this.subCategories,
  });

  final List<SubCategoryModel> subCategories;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: subCategories.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: GestureDetector(
            child: CategoryItem(
              categoryName: subCategories[index].subCategoryName,
              imagePath: subCategories[index].subCategoryImagePath,
            ),
            onTap: () {
              navigatorPush(
                context,
                CategoryRecipesView(
                  categoryName: subCategories[index].categoryName,
                  subCategoryName: subCategories[index].subCategoryName,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
