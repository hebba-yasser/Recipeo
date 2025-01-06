import 'package:flutter/material.dart';

import 'collections_sections.dart';
import 'liked_section.dart';

class LibraryContentSection extends StatelessWidget {
  const LibraryContentSection({
    super.key,
    required this.tabController,
  });
  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TabBarView(
        controller: tabController,
        children: const [
          LikedSection(),
          CollectionsSections(),
        ],
      ),
    );
  }
}
