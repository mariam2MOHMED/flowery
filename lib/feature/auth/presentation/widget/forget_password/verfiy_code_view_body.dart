import 'package:flutter/cupertino.dart';

import '../../../../../core/l10n/app_localizations.dart';
import 'forget_password_header.dart';

class VerfiyCodeViewBody extends StatelessWidget {
  const VerfiyCodeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const   SizedBox(height: 40.0,),
        ForgetPasswordHeader(title:
        AppLocalizations.of(context)!.emailverification,
            subTitle:
            AppLocalizations.of(context)!.
            pleaseEnterYourCodeThatSentToYourEmailAddress),
        const   SizedBox(height: 32.0,),

      ],
    );
  }
}
