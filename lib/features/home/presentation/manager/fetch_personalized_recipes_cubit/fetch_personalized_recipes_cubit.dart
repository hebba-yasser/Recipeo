import 'package:bloc/bloc.dart';

import '../../../data/repos/home_repo.dart';
import 'fetch_personalized_recipes_state.dart';

class FetchPersonalizedRecipesCubit
    extends Cubit<FetchPersonalizedRecipesState> {
  final HomeRepo homeRepo;

  FetchPersonalizedRecipesCubit(this.homeRepo)
      : super(PersonalizedRecipesInitial());

  Future<void> fetchPersonalizedRecipes({required String id}) async {
    emit(PersonalizedRecipesLoading());
    var result = await homeRepo.fetchPersonalizedRecipe(
      id: id,
    );
    result.fold((failure) {
      emit(PersonalizedRecipesFailure(failure.errMessage));
    }, (recipes) {
      emit(PersonalizedRecipesSuccess(recipes));
    });
  }
}
