import 'package:flutter/cupertino.dart';

import '../../../../../core/data/data_sources/categories_data.dart';
import '../../../../../core/utils/functions/Navigaor_push.dart';
import '../../../../categories/presentation/views/category_recipes_view.dart';
import 'circle_category_item.dart';

class CircleCategoryListView extends StatelessWidget {
  const CircleCategoryListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: CategoriesDataSource.categoriesList[2].categoryName.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(left: 12, top: 5, bottom: 10),
            child: GestureDetector(
              onTap: () {
                navigatorPush(
                    context,
                    CategoryRecipesView(
                      subCategoryName: CategoriesDataSource.categoriesList[2]
                          .subCategories[index].subCategoryName,
                      categoryName: CategoriesDataSource
                          .categoriesList[2].subCategories[index].categoryName,
                    ));
              },
              child: CircleCategoryItem(
                categoryName: CategoriesDataSource
                    .categoriesList[2].subCategories[index].subCategoryName,
                imagePath: CategoriesDataSource.categoriesList[2]
                    .subCategories[index].subCategoryImagePath,
              ),
            ),
          );
        },
      ),
    );
  }
}
