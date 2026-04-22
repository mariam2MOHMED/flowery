import 'package:flowerecommeric/core/l10n/app_localizations.dart';
import 'package:flowerecommeric/core/theme/app_colors.dart';
import 'package:flowerecommeric/core/theme/font_manager.dart';
import 'package:flowerecommeric/core/theme/font_style.dart';
import 'package:flutter/cupertino.dart';

class TitleHeader extends StatelessWidget {
  const TitleHeader({super.key,
    required this.title,required this.onTap});
final String title;final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      
      children: [
      Text(title,style: getBoldStyle(color: AppColors.black,
      fontSize: FontSize.s18
      ),),
        const Spacer(),
        GestureDetector(
          onTap:onTap,
          child:     Text(AppLocalizations.of(context)!.viewAll
            ,style: getMediumStyle(color: AppColors.pink,
              fontSize: FontSize.s18
          ).copyWith(
              decoration: TextDecoration.underline,
              decorationColor: AppColors.pink,
            ),),
        )
      ],
    );
  }
}
