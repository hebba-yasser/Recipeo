import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'filter_state.dart';

class FilterCubit extends Cubit<FilterState> {
  FilterCubit() : super(ChipsInitial());

  List<String> selectedDishType = [];
  List<String> selectedCuisines = [];
  List<String> selectedDiets = [];
  List<String> selectedIntolerance = [];
  List<String> includedIngredients = [];
  List<String> excludedIngredients = [];
  String query = '';
  bool showDishType = false;
  bool showCuisines = false;
  bool showDiets = false;
  bool showIntolerance = false;

  void updatePreference(List<dynamic> preferenceList, String label) {
    if (preferenceList.contains(label)) {
      preferenceList.remove(label);
    } else {
      preferenceList.add(label);
    }
    checkIfFiltersAreEmpty();
  }

  void selectQuery(String label) {
    query = label;
    checkIfFiltersAreEmpty();
  }

  void selectIncludedIngredients(String label) {
    if (!includedIngredients.contains(label)) {
      includedIngredients.add(label); // Select chip
    }
    emit(IncludedIngredientSelected());
    checkIfFiltersAreEmpty();
  }

  void removeIncludedIngredient(String label) {
    if (includedIngredients.contains(label)) {
      includedIngredients.remove(label); // Select chip
    }
    emit(RemoveIncludedIngredient());
    checkIfFiltersAreEmpty();
  }

  void removeExcludedIngredient(String label) {
    if (excludedIngredients.contains(label)) {
      excludedIngredients.remove(label); // Select chip
    }
    emit(RemoveExcludedIngredient());
    checkIfFiltersAreEmpty();
  }

  void selectExcludedIngredients(String label) {
    if (excludedIngredients.contains(label)) {
      excludedIngredients.remove(label); // Unselect chip
    } else {
      excludedIngredients.add(label); // Select chip
    }
    emit(ExcludedIngredientSelected());
    checkIfFiltersAreEmpty();
  }

  void clearALLChips() {
    query = '';
    selectedDishType = [];
    selectedCuisines = [];
    selectedDiets = [];
    selectedIntolerance = [];
    includedIngredients = [];
    excludedIngredients = [];
    showDishType = false;
    showCuisines = false;
    showDiets = false;
    showIntolerance = false;
    emit(ClearAllChips());
    checkIfFiltersAreEmpty();
  }

  void toggleDishType() {
    showDishType = !showDishType;
    emit(DishTypeToggleState());
    checkIfFiltersAreEmpty();
  }

  void toggleCuisines() {
    showCuisines = !showCuisines;
    emit(CuisinesToggleState());
    checkIfFiltersAreEmpty();
  }

  void toggleDiets() {
    showDiets = !showDiets;
    emit(DietsChipsToggleState());
    checkIfFiltersAreEmpty();
  }

  void toggleIntolerance() {
    showIntolerance = !showIntolerance;
    emit(IntoleranceToggleState());
    checkIfFiltersAreEmpty();
  }

  void checkIfFiltersAreEmpty() {
    bool isEmpty = selectedDishType.isEmpty &&
        selectedCuisines.isEmpty &&
        selectedDiets.isEmpty &&
        selectedIntolerance.isEmpty &&
        includedIngredients.isEmpty &&
        excludedIngredients.isEmpty &&
        query.isEmpty;
    if (isEmpty) {
      emit(FiltersEmpty()); // Emit empty state
    } else {
      emit(FiltersNotEmpty()); // Emit not-empty state
    }
  }
}
