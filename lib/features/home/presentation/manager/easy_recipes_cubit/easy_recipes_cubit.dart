import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:recpie_app/features/home/data/repos/home_repo.dart';

import '../../../../../core/data/models/recipe_model/recipe_model.dart';

part 'easy_recipes_state.dart';

class EasyRecipesCubit extends Cubit<EasyRecipesState> {
  EasyRecipesCubit(this.homeRepo) : super(EasyRecipesInitial());
  final HomeRepo homeRepo;
  Future<void> fetchEasyRecipes() async {
    emit(EasyRecipesLoading());
    var result = await homeRepo.fetchEasyRecipes();
    result.fold((failure) {
      emit(EasyRecipesFailure(failure.errMessage));
    }, (recipes) {
      emit(EasyRecipesSuccess(recipes));
    });
  }
}
