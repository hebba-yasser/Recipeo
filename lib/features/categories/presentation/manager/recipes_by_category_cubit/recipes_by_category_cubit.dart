import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:recpie_app/features/categories/data/repos/categories_repos.dart';

import '../../../../../core/data/models/recipe_model/recipe_model.dart';
import '../../../../../core/errors/failure.dart';

part 'recipes_by_category_state.dart';

class RecipesByCategoryCubit extends Cubit<RecipesByCategoryState> {
  RecipesByCategoryCubit(this.categoryRepos)
      : super(RecipesByCategoryInitial());
  final CategoryRepos categoryRepos;

  Future<void> fetchRecipesByCategory(
      String categoryName, String subCategoryName) async {
    emit(RecipesByCategoryLoading());

    Either<Failure, List<RecipeModel>> result;
    try {
      switch (categoryName) {
        case 'Courses':
          result = await categoryRepos.fetchMealTypeRecipes(
              type: subCategoryName.toLowerCase());
          break;
        case 'Cuisines':
          result = await categoryRepos.fetchCuisineRecipes(
              cuisine: subCategoryName.toLowerCase());
          break;
        case 'Diets':
          result = await categoryRepos.fetchDietRecipes(
              diet: subCategoryName.toLowerCase());
          break;
        case 'Intolerance Free':
          result = await categoryRepos.fetchIntoleranceRecipes(
              intolerances: subCategoryName.toLowerCase());
          break;
        case 'Dishes':
        case 'Cocktails':
        case 'Milkshakes and Shakes':
        case 'Coffee and Tea':
        case 'Smoothies':
        case 'Non-Alcoholic Drinks':
          print(subCategoryName);
          result =
              await categoryRepos.fetchQueryRecipes(query: subCategoryName);
          break;
        default:
          emit(RecipesByCategoryFailure("Category not found"));
          return;
      }

      result.fold(
        (failure) {
          emit(RecipesByCategoryFailure(failure.errMessage));
        },
        (recipes) {
          emit(RecipesByCategorySuccess(recipes));
        },
      );
    } catch (e) {
      emit(RecipesByCategoryFailure(e.toString()));
    }
  }
}
