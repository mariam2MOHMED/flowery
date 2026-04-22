import 'package:flowerecommeric/core/l10n/app_localizations.dart';
import 'package:flowerecommeric/core/validator/validator.dart';
import 'package:flowerecommeric/feature/auth/presentation/view_model/login/login_cubit.dart';
import 'package:flowerecommeric/feature/auth/presentation/view_model/login/login_intent.dart';
import 'package:flowerecommeric/feature/auth/presentation/view_model/login/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserLoginInfo extends StatelessWidget {
  const UserLoginInfo({super.key,
    required this.email,
    required this.pssword, this.onChanged});
final TextEditingController email;
  final TextEditingController pssword;
final  void Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          controller: email,
onChanged: onChanged,
          validator:(val)=>
              Validator.validateEmail(context, val),
          decoration:InputDecoration(
            labelText: AppLocalizations.of(context)!.email,
            hintText: AppLocalizations.of(context)!.enterEmail
          ) ,
        ),
       const SizedBox(height: 32.0,),
       BlocSelector<LoginCubit,LoginState,bool>
         (selector: (state)=>state.obsecure,
           builder: (context,obsecure){
           return  TextFormField(
             controller: pssword,
             onChanged: onChanged,

             autocorrect: false,
             obscureText: obsecure,
             enableSuggestions: false,
contextMenuBuilder: (context, editableTextState){
  return const SizedBox.shrink();

},
             validator:(val)=>
                 Validator.validatePassword(context, val),
             decoration:InputDecoration(
               suffixIcon: IconButton(onPressed: (){
                 context.read<LoginCubit>().doIntent(intent: const TogglePasswordVisibilityIntent());
               }, icon:
               Icon(obsecure?Icons.visibility:Icons.visibility_off)),
                 labelText: AppLocalizations.of(context)!.password,
                 hintText: AppLocalizations.of(context)!.enterPassword
             ) ,
           );
       })
      ],
    );
  }
}
