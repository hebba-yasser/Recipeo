import 'package:flutter/material.dart';

import '../../../../../core/styles/fonts.dart';

class ListBuilderItem extends StatelessWidget {
  const ListBuilderItem({
    super.key,
    required this.onpressed,
    required this.text,
    this.leading,
  });

  final GestureTapCallback onpressed;
  final String text;
  final Widget? leading;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onpressed,
      horizontalTitleGap: 0,
      contentPadding: const EdgeInsets.symmetric(horizontal: 12),
      title: Text(
        text,
        style: AppFonts.bodyText16,
      ),
      trailing: const Icon(
        Icons.arrow_outward_outlined,
        color: Colors.grey,
      ),
      leading: leading,
    );
  }
}
