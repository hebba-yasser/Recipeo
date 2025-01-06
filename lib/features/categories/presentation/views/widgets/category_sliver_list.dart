import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../core/data/data_sources/categories_data.dart';
import '../../../../../core/utils/functions/Navigaor_push.dart';
import '../sub_category_view.dart';
import 'category_item.dart';

class CategorySliverList extends StatelessWidget {
  const CategorySliverList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        childCount: CategoriesDataSource.categoriesList.length,
        (context, index) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: GestureDetector(
            child: CategoryItem(
              categoryName:
                  CategoriesDataSource.categoriesList[index].categoryName,
              imagePath: CategoriesDataSource.categoriesList[index].imagePath,
            ),
            onTap: () {
              navigatorPush(
                context,
                SubCategoryView(
                  categoryName:
                      CategoriesDataSource.categoriesList[index].categoryName,
                  subCategories:
                      CategoriesDataSource.categoriesList[index].subCategories,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
