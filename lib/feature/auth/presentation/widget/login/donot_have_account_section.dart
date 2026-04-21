import 'package:flowerecommeric/core/l10n/app_localizations.dart';
import 'package:flowerecommeric/core/route_manage/app_routes.dart';
import 'package:flowerecommeric/core/theme/app_colors.dart';
import 'package:flowerecommeric/core/theme/font_style.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class DonotHaveAccountSection extends StatelessWidget {
  const DonotHaveAccountSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text.rich(
          TextSpan(
            text: AppLocalizations.of(context)!.donotHaveAccount,
            style: getBoldStyle(color: AppColors.black, fontSize: 16.0),
            children: [
              TextSpan(
                text: AppLocalizations.of(context)!.signUp,
                style: getBoldStyle(
                  color: AppColors.pink,
                  fontSize: 16.0,
                ).copyWith(decoration: TextDecoration.underline,
                decorationColor: AppColors.pink,
                  decorationThickness: 1.0
                ),
                recognizer: TapGestureRecognizer()..onTap = () {
                  Navigator.of(context).pushNamed(AppRoutes.signup);
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
