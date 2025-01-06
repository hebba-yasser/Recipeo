import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:recpie_app/core/utils/functions/custom_loading_indicator.dart';
import 'package:recpie_app/features/Search/presetation/manager/fetch_recipes_by_query_cubit/fetch_recipe_by_query_cubit.dart';
import 'package:recpie_app/features/Search/presetation/views/widgets/list_builder_item.dart';

import '../../../../../core/cubits/user_data_cubit/user_data_cubit.dart';
import '../../../../../core/cubits/user_data_cubit/user_data_state.dart';
import '../../../../../core/styles/fonts.dart';

class ResentSearchSection extends StatelessWidget {
  const ResentSearchSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserDataCubit, UserDataState>(
      builder: (context, userState) {
        if (userState is UserDataFailure) {
          return Text(userState.errMessage);
        } else if (userState is UserDataSuccess) {
          return ConditionalBuilder(
            condition: userState.user.recentSearch!.isEmpty,
            builder: (context) => const SizedBox(),
            fallback: (context) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Recent Search',
                    style: AppFonts.caption,
                  ),
                  Expanded(
                    child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: userState.user.recentSearch?.length,
                      itemBuilder: (context, index) {
                        return ListBuilderItem(
                          onpressed: () {
                            context
                                .read<FetchRecipeByQueryCubit>()
                                .fetchRecipeByQuery(
                                    query: userState.user.recentSearch?[index]);
                          },
                          text: userState.user.recentSearch?[index],
                          leading: const Icon(
                            FontAwesomeIcons.magnifyingGlass,
                            color: Colors.grey,
                            size: 16,
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        } else {
          return customLoadingIndicator();
        }
      },
    );
  }
}
