import 'package:flowerecommeric/core/theme/app_colors.dart';
import 'package:flowerecommeric/core/theme/font_manager.dart';
import 'package:flowerecommeric/core/theme/font_style.dart';
import 'package:flutter/material.dart';
class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key, required this.image, 
    required this.title});
final String image;
final String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width:68.0,
          height: 64.0,
          padding: const EdgeInsetsDirectional.all(16),
          decoration: BoxDecoration(
            color: AppColors.lightPink,
            borderRadius: BorderRadius.circular(20.0),

          ),
child: image.isEmpty || image == 'placeholder'
    ?const SizedBox()
    : Image.network(image,fit: BoxFit.fill,
  errorBuilder: (context, error, stackTrace) =>
  const Icon(Icons.image_not_supported),
),
        ),
        const SizedBox(height: 16.0,),
        Text(title,style: getMediumStyle(color: AppColors.black,fontSize: FontSize.s14),)
      ],
    );
  }
}
