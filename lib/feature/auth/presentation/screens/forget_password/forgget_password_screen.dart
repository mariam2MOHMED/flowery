import 'package:flowerecommeric/feature/auth/presentation/widget/forget_password/forget_password_view_body.dart';
import 'package:flutter/material.dart';

import '../../../../../core/l10n/app_localizations.dart';
import '../../../../../core/theme/app_colors.dart';

class ForggetPasswordScreen extends StatelessWidget {
  const ForggetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.arrow_back_ios,
          color: AppColors.txtBlack,
          size: 20.0,
        ),
        title: Text(AppLocalizations.of(context)!.forgetPassword),
      ),
      body:const ForgetPasswordViewBody() ,
    );
  }
}
