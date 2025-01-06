part of 'filter_cubit.dart';

@immutable
sealed class FilterState {}

final class ChipsInitial extends FilterState {}

final class DishTypeChipsSelected extends FilterState {}

final class CuisinesChipsSelected extends FilterState {}

final class DietsChipsSelected extends FilterState {}

final class IntoleranceChipsSelected extends FilterState {}

final class IncludedIngredientSelected extends FilterState {}

final class ExcludedIngredientSelected extends FilterState {}

final class RemoveIncludedIngredient extends FilterState {}

final class RemoveExcludedIngredient extends FilterState {}

final class ClearAllChips extends FilterState {}

final class DifficultyToggleState extends FilterState {}

final class DishTypeToggleState extends FilterState {}

final class CuisinesToggleState extends FilterState {}

final class DietsChipsToggleState extends FilterState {}

final class IntoleranceToggleState extends FilterState {}

class FiltersEmpty extends FilterState {} // All fields are empty

class FiltersNotEmpty extends FilterState {}
