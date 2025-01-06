import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:recpie_app/features/home/data/repos/home_repo.dart';

import '../../../../../core/data/models/recipe_model/recipe_model.dart';

part 'popular_recipes_state.dart';

class PopularRecipesCubit extends Cubit<PopularRecipesState> {
  PopularRecipesCubit(this.homeRepo) : super(PopularRecipesInitial());
  final HomeRepo homeRepo;
  Future<void> fetchPopularRecipes() async {
    emit(PopularRecipesLoading());
    var result = await homeRepo.fetchPopularRecipes();
    result.fold((failure) {
      emit(PopularRecipesFailure(failure.errMessage));
    }, (recipes) {
      emit(PopularRecipesSuccess(recipes));
    });
  }
}
