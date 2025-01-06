import 'package:flutter/material.dart';

import '../../../../../core/data/models/user_model/collections_model.dart';
import '../../../../../core/styles/fonts.dart';
import 'collection_image_builder.dart';

class CollectionItem extends StatelessWidget {
  const CollectionItem({
    super.key,
    required this.collection,
  });

  final CollectionModel collection;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      height: 300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          CollectionImageBuilder(collection: collection),
          const SizedBox(
            height: 10,
          ),
          Text(
            collection.collectionName,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: AppFonts.bodyText16.copyWith(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
