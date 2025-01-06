import 'package:flutter/material.dart';

import 'collections_gid_view.dart';
import 'new_collection_tile.dart';

class CollectionsSections extends StatelessWidget {
  const CollectionsSections({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        children: [
          NewCollectionTile(),
          Expanded(
            child: CollectionsGidView(),
          ),
        ],
      ),
    );
  }
}
