import 'package:flutter/material.dart';

import '../../../../../core/l10n/app_localizations.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../widget/forget_password/verfiy_code_view_body.dart';

class VerfiyCodeScreen extends StatelessWidget {
  const VerfiyCodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.arrow_back_ios,
          color: AppColors.txtBlack,
          size: 20.0,
        ),
        title: Text(AppLocalizations.of(context)!.password),
      ),
      body: const VerfiyCodeViewBody() ,
    );
  }
}
