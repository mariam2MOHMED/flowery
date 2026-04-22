import 'package:flowerecommeric/core/l10n/app_localizations.dart';
import 'package:flowerecommeric/core/theme/app_colors.dart';
import 'package:flowerecommeric/core/theme/font_manager.dart';
import 'package:flowerecommeric/core/theme/font_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
class SearchHeader extends StatelessWidget {
  const SearchHeader({super.key});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset('assets/images/Flower.svg',
        width: 20.0,
          height: 20.0,
          fit: BoxFit.cover,
        ),
     const SizedBox(width: 4.5,),
        Text(AppLocalizations.of(context)!.flowery,
        style: getMediumStyle(color: AppColors.pink,
            fontSize: FontSize.s20),
        ),
        const SizedBox(width: 17.0,),
        Expanded(
          child:
          GestureDetector(
            onTap: (){

            },
            child: Container(
              padding: const EdgeInsetsDirectional.symmetric(
                horizontal: 8.0,
                vertical: 8.0
              ),
                decoration: BoxDecoration(
               borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    width: 1.2,
                    color: AppColors.midGray
                  )
                ),
              child: Row(
                children: [
                 const  Icon(Icons.search,color: AppColors.midGray,),
                  const SizedBox(width: 6.0,),
                  Text(AppLocalizations.of(context)!.search,
                  style:getMediumStyle(color: AppColors.midGray,fontSize: FontSize.s16) ,
                  )
                ],
              ),
                ),
          )

        )

      ],
    );
  }
}
