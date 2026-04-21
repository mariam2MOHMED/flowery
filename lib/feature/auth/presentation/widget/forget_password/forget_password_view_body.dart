import 'package:flowerecommeric/core/l10n/app_localizations.dart';
import 'package:flowerecommeric/feature/auth/presentation/widget/forget_password/forget_password_header.dart';
import 'package:flutter/cupertino.dart';

import 'forget_password_form.dart';

class ForgetPasswordViewBody extends StatelessWidget {
  const ForgetPasswordViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return
     Padding(padding: const EdgeInsetsDirectional.symmetric(
       horizontal: 16.0
     ),child:  Column(
       children: [
         const   SizedBox(height: 40.0,),
         ForgetPasswordHeader(title: AppLocalizations.of(context)!.forgetPassword,
             subTitle:
             AppLocalizations.of(context)!.
             pleaseenteryouremailassociatedtoyouraccount),
         const   SizedBox(height: 32.0,),
         const ForgetPasswordForm()

       ],
     ),)
    ;
  }
}
