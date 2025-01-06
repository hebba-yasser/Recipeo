import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/Views/widgets/custom_divider.dart';
import '../../../data/model/auto_complete_search_model.dart';
import '../../manager/fetch_recipes_by_id_cubit/fetch_recipe_by_id_cubit.dart';
import 'list_builder_item.dart';

class SuggestionsListBuilder extends StatelessWidget {
  const SuggestionsListBuilder({
    super.key,
    required this.suggestions,
  });
  final List<SuggestionsModel> suggestions;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        return ListBuilderItem(
          text: suggestions[index].title ?? 'NO Title',
          onpressed: () {
            context
                .read<FetchRecipeByIdCubit>()
                .fetchRecipeById(id: suggestions[index].id ?? 0);
          },
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return const CustomDivider();
      },
    );
  }
}
