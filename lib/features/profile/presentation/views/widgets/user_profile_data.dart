import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../../core/data/models/user_model/user_model.dart';
import '../../../../../core/styles/fonts.dart';

class UserProfileData extends StatelessWidget {
  const UserProfileData({
    super.key,
    required this.user,
  });

  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: Colors.white,
          radius: 75,
          child: CircleAvatar(
            radius: 70,
            backgroundColor: Colors.white,
            backgroundImage: user.imgUrl != null && user.imgUrl!.isNotEmpty
                ? CachedNetworkImageProvider(
                    user.imgUrl!,
                    errorListener: (e) {
                      const Icon(Icons.error);
                    },
                  )
                : const AssetImage('assets/images/no_image.jpg'),
          ),
        ),
        Text(
          user.name ?? 'No Name Available',
          style: AppFonts.heading20,
        ),
      ],
    );
  }
}
