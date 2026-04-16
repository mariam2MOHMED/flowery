import 'package:flowerecommeric/core/l10n/app_localizations.dart';
import 'package:flowerecommeric/core/validator/validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../view_model/register/register_cubit.dart';
import '../view_model/register/register_event.dart';
import '../view_model/register/register_state.dart';

class SignUpUserInfo extends StatelessWidget {
  const SignUpUserInfo({super.key,
    required this.firstName, required this.lastName,
    required this.email, required this.phone,
    required this.password, required this.confirmPassword,
  });
final TextEditingController firstName;
  final TextEditingController lastName;
  final TextEditingController email;
  final TextEditingController phone;
  final TextEditingController password;
  final TextEditingController confirmPassword;


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(child: TextFormField(
              controller:firstName ,
              validator: (value) => Validator.firstNameValidation(context, value),
              decoration: InputDecoration(
                labelText: AppLocalizations.of(context)!.firstName,
                hintText: AppLocalizations.of(context)!.enterFirstName,
              ),
            )),
          const  SizedBox(width: 16.0,),
            Expanded(child: TextFormField(
              controller:lastName ,
              validator: (value) => Validator.lastNameValidation(context, value),
              decoration: InputDecoration(
                labelText: AppLocalizations.of(context)!.lastName,
                hintText: AppLocalizations.of(context)!.enterLastName,
              ),
            )),
          ],
        ),
        const SizedBox(height: 16.0,),
        TextFormField(
          controller:email ,
          validator: (value) => Validator.validateEmail(context, value),
          decoration: InputDecoration(
            labelText: AppLocalizations.of(context)!.email,
            hintText: AppLocalizations.of(context)!.enterEmail,
          ),
        ),
        const SizedBox(height: 16.0,),
        Row(
          children: [
            Expanded(child:
           BlocSelector<RegisterCubit,RegisterState,bool>
             (selector: (state)=>state.isObsecurePass,

               builder: (context,isObsecurePass){
               return  TextFormField(
                 validator: (value) => Validator.validatePassword(context, value),
                 obscureText: isObsecurePass,
                 controller:password ,
                enableSuggestions: false,
                 autocorrect: false,

                 contextMenuBuilder: (context, editableTextState) {
                   return const SizedBox.shrink();
                 },

                 decoration: InputDecoration(
                   suffixIcon: IconButton(
                     onPressed: (){
                       context.read<RegisterCubit>().doIntent(
                           intent: TogglePasswordVisibilityIntent());
                     },
                     icon:  Icon(isObsecurePass?Icons.visibility:Icons.visibility_off)),
                   labelText: AppLocalizations.of(context)!.password,
                   hintText: AppLocalizations.of(context)!.enterPassword,
                 ),
               );
           })
            ),
            const SizedBox(width: 16.0,),
            Expanded(child:
            BlocSelector<RegisterCubit,RegisterState,
                bool>
              (selector: (state)=>state.isObsecureConfirmPass,
                builder: (context,isObsecureConfirmPass){
                return      TextFormField(
                  validator: (value) => Validator.validateConfirmPassword(
                    context,
                    value,
                    password.text,
                  ),
                  controller:confirmPassword ,
obscureText: isObsecureConfirmPass,
                  enableSuggestions: false,
autocorrect: false,
                  contextMenuBuilder: (context, editableTextState) {
                    return const SizedBox.shrink();
                  },

                  decoration: InputDecoration(
                    suffixIcon: IconButton(onPressed: (){
                      context.read<RegisterCubit>().
                      doIntent(intent: ToggleConfirmPasswordVisibilityIntent());
                    }, icon: Icon(isObsecureConfirmPass?Icons.visibility:Icons.visibility_off)),
                    labelText: AppLocalizations.of(context)!.confirmPassword,
                    hintText: AppLocalizations.of(context)!.enterConfirmPassword,
                  ),
                );
                })
            )
          ],
        ),
        const SizedBox(height: 16.0,),
        TextFormField(
          controller:phone ,
          validator: (value) => Validator.validatePhoneNumber(context, value),
          decoration: InputDecoration(
            labelText: AppLocalizations.of(context)!.phone,
            hintText: AppLocalizations.of(context)!.enterPhoneNumber,
          ),
        ),
      ],
    );
  }
}
