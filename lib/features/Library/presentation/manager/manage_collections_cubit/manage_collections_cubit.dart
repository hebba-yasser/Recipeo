import 'package:bloc/bloc.dart';
import 'package:recpie_app/core/data/models/user_model/collections_model.dart';

import '../../../../../constants.dart';
import '../../../../../core/data/models/user_model/small_recipe_model.dart';
import '../../../data/repos/Library_repos.dart';
import '../fetch_collections_cubit/fetch_collections_cubit.dart';
import 'manage_collections_state.dart';

class ManageCollectionsCubit extends Cubit<ManageCollectionsState> {
  final LibraryRepos libraryRepos;
  final FetchCollectionsCubit fetchCollectionsCubit;
  ManageCollectionsCubit(
    this.libraryRepos,
    this.fetchCollectionsCubit,
  ) : super(ManageCollectionsInitial());

  Future<void> createCollection({required CollectionModel collection}) async {
    emit(CreateCollectionLoading());
    var result = await libraryRepos.addCollection(collection: collection);
    result.fold((failure) {
      emit(CreateCollectionFailure(failure.errMessage));
    }, (r) async {
      await fetchCollectionsCubit.fetchCollections(id: uId!);
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
      (r) async {
        await fetchCollectionsCubit.fetchCollections(id: uId!);
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
      (failure) async {
        emit(RemoveRecipesFromCollectionFailure(failure.errMessage));
      },
      (r) async {
        emit(RemoveRecipesFromCollectionSuccess());
        await fetchCollectionsCubit.fetchCollections(id: uId!);
      },
    );
  }

  Future<void> updateCollections({required CollectionModel collection}) async {
    emit(UpdateCollectionsLoading());
    var result = await libraryRepos.updateCollection(collection: collection);
    result.fold(
      (failure) {
        emit(UpdateCollectionsFailure(failure.errMessage));
      },
      (r) async {
        emit(UpdateCollectionsSuccess());
        await fetchCollectionsCubit.fetchCollections(id: uId!);
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
      (r) async {
        emit(MoveRecipesSuccess());
        await fetchCollectionsCubit.fetchCollections(id: uId!);
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
}
