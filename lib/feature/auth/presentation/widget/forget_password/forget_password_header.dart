import 'package:flowerecommeric/core/theme/app_colors.dart';
import 'package:flowerecommeric/core/theme/font_manager.dart';
import 'package:flowerecommeric/core/theme/font_style.dart';
import 'package:flutter/cupertino.dart';

class ForgetPasswordHeader extends StatelessWidget {
  const ForgetPasswordHeader({
    super.key,
    required this.title,
    required this.subTitle,
  });

  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          textAlign: TextAlign.center,
          style: getBoldStyle(color: AppColors.black, fontSize: FontSize.s18),
        ),
        const SizedBox(height: 16.0),
        Text(
          subTitle,
          textAlign: TextAlign.center,
          style: getBoldStyle(color: AppColors.gray, fontSize: FontSize.s14),
        ),
      ],
    );
  }
}
