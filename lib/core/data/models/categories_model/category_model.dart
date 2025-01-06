import 'package:recpie_app/core/data/models/categories_model/sub_category_model.dart';

class CategoryModel {
  final String categoryName;
  final String imagePath;
  final List<SubCategoryModel> subCategories;

  const CategoryModel({
    required this.categoryName,
    required this.imagePath,
    this.subCategories = const [],
  });
}
