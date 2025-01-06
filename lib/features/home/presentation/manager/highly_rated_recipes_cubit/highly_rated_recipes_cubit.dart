import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:recpie_app/features/home/data/repos/home_repo.dart';

import '../../../../../core/data/models/recipe_model/recipe_model.dart';

part 'highly_rated_recipes_state.dart';

class HighlyRatedRecipesCubit extends Cubit<HighlyRatedRecipesState> {
  HighlyRatedRecipesCubit(this.homeRepo) : super(HighlyRatedRecipesInitial());
  final HomeRepo homeRepo;
  Future<void> fetchHighlyRatedRecipes() async {
    emit(HighlyRatedRecipesLoading());
    var result = await homeRepo.fetchHighlyRatedRecipes();
    result.fold((failure) {
      emit(HighlyRatedRecipesFailure(failure.errMessage));
    }, (recipes) {
      emit(HighlyRatedRecipesSuccess(recipes));
    });
  }
}
