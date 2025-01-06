import 'package:flutter/cupertino.dart';

import '../../../../../core/styles/fonts.dart';

class LibraryHeader extends StatelessWidget {
  const LibraryHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Text(
        'Your Library',
        style: AppFonts.heading24,
      ),
    );
  }
}
