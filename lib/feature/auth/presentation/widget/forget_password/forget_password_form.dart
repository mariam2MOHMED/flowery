import 'package:flowerecommeric/core/l10n/app_localizations.dart';
import 'package:flowerecommeric/core/validator/validator.dart';
import 'package:flutter/material.dart';


class ForgetPasswordForm extends StatelessWidget {
  const ForgetPasswordForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Column(
      children: [
        TextFormField(
          validator: (val)=>Validator.validateEmail(context, val),
          decoration: InputDecoration(
            labelText:AppLocalizations.of(context)!.email,
            hintText: AppLocalizations.of(context)!.enterEmail
          ),
        ),
        const SizedBox(height: 48.0,),
        ElevatedButton(
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(double.infinity, 50),
            ),
            onPressed: (){},
            child: Text(AppLocalizations.of(context)!.continueWord))
      ],
    ));
  }
}
