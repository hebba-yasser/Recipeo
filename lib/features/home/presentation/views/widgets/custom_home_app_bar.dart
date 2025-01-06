import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../constants.dart';
import '../../../../../core/cubits/user_data_cubit/user_data_cubit.dart';
import '../../../../../core/cubits/user_data_cubit/user_data_state.dart';
import '../../../../../core/styles/fonts.dart';
import 'custom_notification_button.dart';
import 'custom_search_bar_container.dart';

class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: kprimaryColor,
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          BlocBuilder<UserDataCubit, UserDataState>(
            builder: (context, state) {
              return BlocBuilder<UserDataCubit, UserDataState>(
                builder: (context, state) {
                  if (state is UserDataSuccess) {
                    return ListTile(
                      horizontalTitleGap: 0,
                      minVerticalPadding: 0,
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 12),
                      leading: CircleAvatar(
                        radius: 32,
                        backgroundImage: state.user.imgUrl != null &&
                                state.user.imgUrl!.isNotEmpty
                            ? CachedNetworkImageProvider(
                                state.user.imgUrl!,
                                errorListener: (e) {
                                  const Icon(Icons.error);
                                },
                              )
                            : const AssetImage('assets/images/no_image.jpg'),
                      ),
                      trailing: const CustomNotificationButton(),
                      title: Text(
                        'HELLO , ${state.user.name}',
                        style: AppFonts.bodyText16.copyWith(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        'Check Amazing Recipes...',
                        style: AppFonts.caption.copyWith(
                          color: Colors.white,
                        ),
                      ),
                    );
                  } else {
                    return const Center(
                        child: CircularProgressIndicator(
                      color: Colors.white,
                    ));
                  }
                },
              );
            },
          ),
          const CustomSearchBarContainer(),
        ],
      ),
    );
  }
}
