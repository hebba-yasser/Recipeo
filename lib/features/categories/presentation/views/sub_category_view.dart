import 'package:flutter/material.dart';
import 'package:recpie_app/features/categories/presentation/views/widgets/sub_category_view_body.dart';

import '../../../../core/data/models/categories_model/sub_category_model.dart';

class SubCategoryView extends StatelessWidget {
  const SubCategoryView({
    super.key,
    required this.subCategories,
    required this.categoryName,
  });
  final String categoryName;
  final List<SubCategoryModel> subCategories;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 20),
          child: SubCategoryViewBody(
              categoryName: categoryName, subCategories: subCategories),
        ),
      ),
    );
  }
}
