import 'package:flutter/material.dart';

import '../../../../../constants.dart';
import '../../../../../core/styles/fonts.dart';

class ProfileListTileItem extends StatelessWidget {
  const ProfileListTileItem({
    super.key,
    required this.leadingIcon,
    required this.title,
    required this.onTap,
  });
  final IconData leadingIcon;
  final String title;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      leading: Icon(
        leadingIcon,
        color: kprimaryColor,
      ),
      title: Text(
        title,
        style: AppFonts.bodyText16.copyWith(
          fontWeight: FontWeight.w500,
        ),
      ),
      trailing: const Icon(Icons.arrow_forward_ios),
      onTap: onTap,
    );
  }
}
