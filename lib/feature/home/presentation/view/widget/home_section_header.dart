import 'package:flowerecommeric/core/theme/app_colors.dart';
import 'package:flowerecommeric/core/theme/font_manager.dart';
import 'package:flowerecommeric/core/theme/font_style.dart';
import 'package:flutter/material.dart';

class HomeSectionHeader extends StatelessWidget {
  const HomeSectionHeader({super.key, 
    required this.title, 
    required this.subTitle});
final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(onPressed: (){
          Navigator.of(context).pop();
        }, icon: const Icon(
          Icons.arrow_back_ios,
          color: AppColors.txtBlack,
          size: 20.0,
        ),),

        const SizedBox(width: 4.0,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title,style: getBoldStyle(color: AppColors.black,
              fontSize: FontSize.s20
          ),),
            const SizedBox(height: 4.0,),
            Text(subTitle,style: getMediumStyle(color: AppColors.black,
                fontSize: FontSize.s13
            ),),
          ],
        ),
      ],
    );
  }
}
