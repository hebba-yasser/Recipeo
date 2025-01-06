import 'package:bloc/bloc.dart';
import 'package:recpie_app/core/data/models/user_model/collections_model.dart';

import '../../../../../core/data/models/user_model/small_recipe_model.dart';
import '../../../data/repos/Library_repos.dart';
import 'manage_collections_state.dart';

class ManageCollectionsCubit extends Cubit<ManageCollectionsState> {
  final LibraryRepos libraryRepos;

  ManageCollectionsCubit(this.libraryRepos) : super(ManageCollectionsInitial());

  Future<void> createCollection({required CollectionModel collection}) async {
    emit(CreateCollectionLoading());
    var result = await libraryRepos.addCollection(collection: collection);
    result.fold((failure) {
      emit(CreateCollectionFailure(failure.errMessage));
    }, (r) async {
      emit(CreateCollectionSuccess());
    });
  }

  Future<void> deleteCollections({required CollectionModel collection}) async {
    emit(DeleteCollectionsLoading());
    var result = await libraryRepos.deleteCollection(collection: collection);
    result.fold(
      (failure) {
        emit(DeleteCollectionsFailure(failure.errMessage));
      },
      (r) {
        emit(DeleteCollectionsSuccess());
      },
    );
  }

  List<SmallRecipeModel> selectedRecipes = [];

  Future<void> removeRecipesFromCollections(
      {required String collectionId}) async {
    emit(RemoveRecipesFromCollectionLoading());
    var result = await libraryRepos.removeRecipesFromCollection(
        collectionId: collectionId, recipesList: selectedRecipes);
    result.fold(
      (failure) {
        emit(RemoveRecipesFromCollectionFailure(failure.errMessage));
      },
      (r) {
        emit(RemoveRecipesFromCollectionSuccess());
      },
    );
  }

  void toggleSelectedRecipe({required SmallRecipeModel recipe}) {
    if (selectedRecipes.any((selected) => selected.id == recipe.id)) {
      selectedRecipes.removeWhere((selected) => selected.id == recipe.id);
      emit(RecipeRemoved());
    } else {
      selectedRecipes.add(recipe);
      emit(RecipeSelected());
    }
  }

  bool isSelected({required SmallRecipeModel recipe}) {
    return selectedRecipes.any((selected) => selected.id == recipe.id);
  }

  bool isEditable = false;

  void toggleEdit() {
    isEditable = !isEditable;
    selectedRecipes = [];
    emit(ChangeEditState());
  }

  Future<void> updateCollections({required CollectionModel collection}) async {
    emit(UpdateCollectionsLoading());
    var result = await libraryRepos.updateCollection(collection: collection);
    result.fold(
      (failure) {
        emit(UpdateCollectionsFailure(failure.errMessage));
      },
      (r) {
        emit(UpdateCollectionsSuccess());
      },
    );
  }

  Future<void> moveRecipe({
    required String removeCollectionId,
    required String newCollectionId,
    required List<SmallRecipeModel> recipesList,
  }) async {
    emit(MoveRecipesLoading());
    var result = await libraryRepos.moveRecipe(
        removeCollectionId: removeCollectionId,
        newCollectionId: newCollectionId,
        recipesList: recipesList);
    result.fold(
      (failure) {
        emit(MoveRecipesFailure(failure.errMessage));
      },
      (r) {
        emit(MoveRecipesSuccess());
      },
    );
  }
}
