import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recpie_app/features/profile/presentation/manager/preferences_cubit/preferences_state.dart';

import '../../../../../core/data/models/user_model/preferences.dart';
import '../../../../../core/data/models/user_model/user_model.dart';
import '../../../data/repos/profile_repos.dart';

class PreferencesCubit extends Cubit<PreferencesState> {
  List<dynamic> cuisinesPreferences = [];
  List<dynamic> dietsPreferences = [];
  List<dynamic> intolerancePreferences = [];
  List<dynamic> excludedIngredientsPreferences = [];
  bool showCuisines = false;
  bool showDiets = false;
  bool showIntolerance = false;
  final UserModel initialUser;
  final ProfileRepos profileRepos;

  PreferencesCubit(
    this.initialUser,
    this.profileRepos,
  ) : super(PreferencesInitial()) {
    cuisinesPreferences = initialUser.preferences?.favouriteCuisines ?? [];
    dietsPreferences = initialUser.preferences?.diets ?? [];
    intolerancePreferences = initialUser.preferences?.allergies ?? [];
    excludedIngredientsPreferences =
        initialUser.preferences?.excludedIngredients ?? [];
  }

  void updatePreference(List<dynamic> preferenceList, String label) {
    if (preferenceList.contains(label)) {
      preferenceList.remove(label);
    } else {
      preferenceList.add(label);
    }

    emit(PreferencesNotEmpty());
    checkIfFiltersAreEmpty();
  }

  void removeExcludedIngredient(String label) {
    if (excludedIngredientsPreferences.contains(label)) {
      excludedIngredientsPreferences.remove(label);
    }
    emit(PreferencesNotEmpty());
    checkIfFiltersAreEmpty();
  }

  void selectExcludedIngredients(String label) {
    if (excludedIngredientsPreferences.contains(label)) {
      excludedIngredientsPreferences.remove(label); // Unselect chip
    } else {
      excludedIngredientsPreferences.add(label); // Select chip
    }
    checkIfFiltersAreEmpty();
  }

  void toggleCuisines() {
    showCuisines = !showCuisines;
    emit(CuisinesPreferencesToggleState());
    checkIfFiltersAreEmpty();
  }

  void toggleDiets() {
    showDiets = !showDiets;
    emit(DietsPreferencesToggleState());
    checkIfFiltersAreEmpty();
  }

  void toggleIntolerance() {
    showIntolerance = !showIntolerance;
    emit(IntolerancePreferencesToggleState());
    checkIfFiltersAreEmpty();
  }

  void clearAllPreferences() {
    cuisinesPreferences.clear();
    dietsPreferences.clear();
    intolerancePreferences.clear();
    excludedIngredientsPreferences.clear();
    showCuisines = false;
    showDiets = false;
    showIntolerance = false;
    emit(PreferencesEmpty());
  }

  void checkIfFiltersAreEmpty() {
    bool isEmpty = cuisinesPreferences.isEmpty &&
        dietsPreferences.isEmpty &&
        intolerancePreferences.isEmpty &&
        excludedIngredientsPreferences.isEmpty;
    if (isEmpty) {
      emit(PreferencesEmpty());
    } else {
      emit(PreferencesNotEmpty());
    }
  }

  Future<void> updatePreferencesData() async {
    emit(SavePreferencesLoading());
    final Preferences preferences = Preferences(
      excludedIngredients: excludedIngredientsPreferences,
      allergies: intolerancePreferences,
      diets: dietsPreferences,
      favouriteCuisines: cuisinesPreferences,
    );
    UserModel updatedUser = UserModel(
      preferences: preferences,
    );
    var result = await profileRepos.updateUserPreferences(user: updatedUser);
    result.fold((failure) {
      emit(SavePreferencesError(failure.errMessage));
    }, (newUser) async {
      emit(SavePreferencesSuccess(newUser));
    });
  }
}
