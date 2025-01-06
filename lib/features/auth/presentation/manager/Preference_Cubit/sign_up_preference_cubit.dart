import 'package:bloc/bloc.dart';
import 'package:recpie_app/features/auth/presentation/manager/Preference_Cubit/sign_up_preference%20_state.dart';

import '../../../../../core/data/models/user_model/preferences.dart';
import '../../../../../core/data/models/user_model/user_model.dart';
import '../../../data/repos/auth_repo.dart';

class SignUpPreferenceCubit extends Cubit<SignUpPreferenceState> {
  final AuthRepo authRepo;

  SignUpPreferenceCubit(this.authRepo) : super(SignUpPreferenceInitial());
  List<String> cuisinesPreferences = [];
  List<String> dietsPreferences = [];
  List<String> intolerancePreferences = [];
  List<String> excludedIngredientsPreferences = [];

  void updatePreference(List<String> preferenceList, String label) {
    if (preferenceList.contains(label)) {
      preferenceList.remove(label);
    } else {
      preferenceList.add(label);
    }
    print(cuisinesPreferences);
    print(dietsPreferences);
    print(intolerancePreferences);
    print(excludedIngredientsPreferences);
    emit(SignUpPreferenceSelected());
  }

  void removeExcludedIngredient(String label) {
    if (excludedIngredientsPreferences.contains(label)) {
      excludedIngredientsPreferences.remove(label);
      emit(SignUpExcludedIngRemoved());
    }
  }

  void selectExcludedIngredients(String label) {
    if (excludedIngredientsPreferences.contains(label)) {
      excludedIngredientsPreferences.remove(label); // Unselect chip
    } else {
      excludedIngredientsPreferences.add(label); // Select chip
    }
    emit(SignUpExcludedIngSelected());
  }

  Future<void> updateUserPreferences() async {
    emit(SignUpSavePreferencesLoading());
    final Preferences preferences = Preferences(
      excludedIngredients: excludedIngredientsPreferences,
      allergies: intolerancePreferences,
      diets: dietsPreferences,
      favouriteCuisines: cuisinesPreferences,
    );

    UserModel updatedUser = UserModel(
      preferences: preferences,
    );
    var result = await authRepo.updateUserPreferences(user: updatedUser);
    result.fold((failure) {
      emit(SignUpSavePreferencesError(failure.errMessage));
    }, (newUser) async {
      emit(SignUpSavePreferencesSuccess());
    });
  }
}
