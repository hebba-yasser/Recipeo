import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:recpie_app/features/home/data/repos/home_repo.dart';

import '../../../../../core/data/models/recipe_model/recipe_model.dart';

part 'healthy_recipes_state.dart';

class HealthyRecipesCubit extends Cubit<HealthyRecipesState> {
  HealthyRecipesCubit(this.homeRepo) : super(HealthyRecipesInitial());
  final HomeRepo homeRepo;
  Future<void> fetchHealthyRecipes() async {
    emit(HealthyRecipesLoading());
    var result = await homeRepo.fetchHealthyRecipes();
    result.fold((failure) {
      emit(HealthyRecipesFailure(failure.errMessage));
    }, (recipes) {
      emit(HealthyRecipesSuccess(recipes));
    });
  }
}
