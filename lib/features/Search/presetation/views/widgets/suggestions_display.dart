import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recpie_app/features/Search/presetation/views/widgets/recent_search_Section.dart';
import 'package:recpie_app/features/Search/presetation/views/widgets/recipe_by_id_listener.dart';
import 'package:recpie_app/features/Search/presetation/views/widgets/suggestions_list_builder.dart';

import '../../../../../core/utils/functions/custom_loading_indicator.dart';
import '../../manager/suggestion_cubit/suggestions_cubit.dart';

class SuggestionsDisplay extends StatelessWidget {
  const SuggestionsDisplay({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SuggestionsCubit, SuggestionsState>(
      builder: (context, state) {
        if (state is SuggestionSuccess) {
          return RecipeByIdListener(
            child: SuggestionsListBuilder(
              suggestions: state.suggestions,
            ),
          );
        } else if (state is SuggestionFailure) {
          return Center(
            child: Text(
              state.errMessage,
              textAlign: TextAlign.center,
            ),
          );
        } else if (state is SuggestionsLoading) {
          return customLoadingIndicator();
        } else {
          return const ResentSearchSection();
        }
      },
    );
  }
}
