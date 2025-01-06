import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomImage extends StatelessWidget {
  const CustomImage({
    super.key,
    required this.aspectRatio,
    required this.imgUrl,
    this.borderRadius,
  });

  final double aspectRatio;
  final String imgUrl;
  final BorderRadiusGeometry? borderRadius;
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: aspectRatio,
      child: ClipRRect(
        borderRadius: borderRadius ?? BorderRadius.circular(15),
        child: CachedNetworkImage(
          fit: BoxFit.cover,
          imageUrl: imgUrl,
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
      ),
    );
  }
}
