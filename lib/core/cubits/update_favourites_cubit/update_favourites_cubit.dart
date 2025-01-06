import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recpie_app/core/cubits/update_favourites_cubit/update_favourites_state.dart';
import 'package:recpie_app/core/data/models/user_model/small_recipe_model.dart';
import 'package:recpie_app/core/repos/shared_repos.dart';

class UpdateFavouritesCubit extends Cubit<UpdateFavouritesState> {
  UpdateFavouritesCubit(
    this.sharedRepos,
  ) : super(UpdateFavouritesInitial());
  final SharedRepos sharedRepos;
  Future<void> updateFavourites({required SmallRecipeModel recipe}) async {
    emit(UpdateFavouritesLoading());
    var result = await sharedRepos.updateUserFavourites(recipe: recipe);
    result.fold((failure) {
      emit(UpdateFavouritesFailure(failure.errMessage));
    }, (r) async {
      emit(UpdateFavouritesSuccess());
    });
  }
}
