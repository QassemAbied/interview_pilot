import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class AppCachedNetworkImage extends StatelessWidget {
  const AppCachedNetworkImage({
    super.key,
    required this.imageUrl,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.radius = 16,
  });

  final String imageUrl;

  final double? width;

  final double? height;

  final BoxFit fit;

  final double radius;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        width: width,
        height: height,
        fit: fit,

        placeholder: (_, _) {
          return Container(
            color: AppColors.neutral100,
            child: const Center(child: CircularProgressIndicator()),
          );
        },

        errorWidget: (_, _, _) {
          return Container(
            color: AppColors.neutral100,
            child: const Icon(
              Icons.broken_image_rounded,
              size: 40,
              color: AppColors.textHint,
            ),
          );
        },
      ),
    );
  }
}
