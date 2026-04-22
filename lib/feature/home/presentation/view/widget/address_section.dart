import 'package:flowerecommeric/core/l10n/app_localizations.dart';
import 'package:flowerecommeric/core/theme/app_colors.dart';
import 'package:flowerecommeric/core/theme/font_manager.dart';
import 'package:flowerecommeric/core/theme/font_style.dart';
import 'package:flutter/cupertino.dart';
class AddressSection extends StatelessWidget {
  const AddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(CupertinoIcons.location_solid,color: AppColors.black,),
        const SizedBox(width: 11.5,),
        Text(AppLocalizations.of(context)!.noLocationFound,
        style: getMediumStyle(color:
        AppColors.black,fontSize:FontSize.s14),
        ),
        const Icon(CupertinoIcons.chevron_down,color: AppColors.pink,),
      ],
    );
  }
}
