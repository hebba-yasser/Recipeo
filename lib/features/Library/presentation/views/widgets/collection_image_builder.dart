import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';

import '../../../../../core/Views/widgets/custom_image.dart';
import '../../../../../core/data/models/user_model/collections_model.dart';

class CollectionImageBuilder extends StatelessWidget {
  const CollectionImageBuilder({
    super.key,
    required this.collection,
  });

  final CollectionModel collection;

  @override
  Widget build(BuildContext context) {
    return ConditionalBuilder(
      condition: collection.recipes!.isEmpty,
      builder: (context) => AspectRatio(
        aspectRatio: 2.4 / 2.4,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.grey.shade100,
                  Colors.grey.shade400,
                ]),
          ),
        ),
      ),
      fallback: (context) => ConditionalBuilder(
        condition: collection.recipes!.length > 3,
        builder: (context) => AspectRatio(
          aspectRatio: 2.4 / 2.4,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: GridView.builder(
              itemCount: 4,
              itemBuilder: (context, index) => CustomImage(
                borderRadius: BorderRadius.circular(0),
                imgUrl: collection.recipes?[index].image ?? '',
                aspectRatio: 2.4 / 2.4,
              ),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 0,
                mainAxisSpacing: 0,
              ),
            ),
          ),
        ),
        fallback: (context) => CustomImage(
          imgUrl: collection.recipes?[0].image ?? '',
          aspectRatio: 2.4 / 2.4,
        ),
      ),
    );
  }
}
