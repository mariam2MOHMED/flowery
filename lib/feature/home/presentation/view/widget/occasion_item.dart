import 'package:cached_network_image/cached_network_image.dart';
import 'package:flowerecommeric/core/theme/app_colors.dart';
import 'package:flowerecommeric/core/theme/font_manager.dart';
import 'package:flowerecommeric/core/theme/font_style.dart';
import 'package:flutter/material.dart';

class OccasionItem extends StatelessWidget {
  const OccasionItem({
    super.key,

    required this.title,
    required this.image,
  });

  final String title;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CachedNetworkImage(
          imageUrl: image,
          width: 131,
          height: 151,
          fit: BoxFit.cover,
          errorWidget: (context, error, stackTrace) =>
          const Icon(Icons.image_not_supported,size: 50.0,
            color: AppColors.lightPink,

          ),
        ),
        const SizedBox(height: 8.0),

        Text(
         title,
          style: getBoldStyle(color: AppColors.black, fontSize: FontSize.s14),
        ),
      ],
    );
  }
}
