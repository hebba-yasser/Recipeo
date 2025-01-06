import 'package:flutter/material.dart';

import '../../../../../core/styles/fonts.dart';

class LibrarySheetAppBar extends StatelessWidget {
  const LibrarySheetAppBar({
    super.key,
    required this.title,
    required this.onPressed,
  });

  final String title;

  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Spacer(),
        Text(
          title,
          style: AppFonts.bodyText18.copyWith(fontWeight: FontWeight.bold),
        ),
        const Spacer(),
        IconButton(
          onPressed: onPressed,
          icon: const Icon(Icons.clear),
        ),
      ],
    );
  }
}
