class SubCategoryModel {
  final String subCategoryName;
  final String categoryName;
  final String subCategoryImagePath; // New property for subcategory image

  SubCategoryModel({
    required this.subCategoryName,
    required this.categoryName,
    required this.subCategoryImagePath, // Default image path is empty
  });
}
