//
// class RecentSearch extends Equatable {
//   final int recipeId;
//   final String recipeTitle;
//
//   const RecentSearch({
//     required this.recipeId,
//     required this.recipeTitle,
//   });
//
//   factory RecentSearch.fromJson(Map<String, dynamic> json) => RecentSearch(
//         recipeId: json['recipeId'] as int,
//         recipeTitle: json['recipeTitle'] as String,
//       );
//
//   Map<String, dynamic> toJson() => {
//         'recipeId': recipeId,
//         'recipeTitle': recipeTitle,
//       };
//
//   @override
//   List<Object?> get props {
//     return [
//       recipeId,
//       recipeTitle,
//     ];
//   }
// }
