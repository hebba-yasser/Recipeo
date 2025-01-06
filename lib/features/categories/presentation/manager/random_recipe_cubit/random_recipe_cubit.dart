import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../core/data/models/recipe_model/recipe_model.dart';
import '../../../data/repos/categories_repos.dart';

part 'random_recipe_state.dart';

class RandomRecipeCubit extends Cubit<RandomRecipeState> {
  final CategoryRepos categoryRepos;
  RandomRecipeCubit(this.categoryRepos) : super(RandomRecipeInitial());
  Future<void> fetchRandomRecipe() async {
    var result = await categoryRepos.fetchRandomRecipe();
    result.fold(((failure) {
      emit(RandomRecipeFailure(failure.errMessage));
    }), ((recipe) {
      emit(RandomRecipeSuccess(recipe));
    }));
  }
}
