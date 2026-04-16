import 'package:flowerecommeric/core/common_widget/snack_bar_widgets.dart';
import 'package:flowerecommeric/core/theme/app_colors.dart';
import 'package:flowerecommeric/core/theme/font_style.dart';
import 'package:flowerecommeric/feature/auth/presentation/widget/gender_section.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/l10n/app_localizations.dart';
import '../view_model/register/register_cubit.dart';
import '../view_model/register/register_event.dart';
import '../view_model/register/register_state.dart';
import 'sign_up_user_info.dart';

class SignUpScreenBody extends StatelessWidget {
  const SignUpScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<RegisterCubit>();
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back_ios,
        color:AppColors.txtBlack ,size:20.0,
        ),
        title: Text(AppLocalizations.of(context)!.signUp),
      ),
      body:
 SingleChildScrollView(
   child:    Padding(padding:
   const EdgeInsetsDirectional.symmetric(
       horizontal: 16.0,vertical: 24.0
   ),
       child:
  BlocListener<RegisterCubit,RegisterState>(
    listenWhen: (prev,curr)=>prev.registerStatus!=curr.registerStatus,
    listener: (context,state){

 if(state.registerStatus.isSuccess){
SnackBarWidgets.showSuccessMessage(
    message: AppLocalizations.of(context)!.registerSuccess,
    context: context);
 }
 if(state.registerStatus.isFailure){
   SnackBarWidgets.showErrorMessage(
       message: state.registerStatus.error!.message,
       context: context);
 }
  },
  child: Form(
    key: cubit.registerFormKey,
    autovalidateMode: cubit.autovalidateMode,
    child:   Column(
      children: [
        SignUpUserInfo(firstName: cubit.firstName,
          lastName: cubit.lastName,
          email: cubit.email,
          phone: cubit.phone,
          password: cubit.password,
          confirmPassword: cubit.confirmPassword,),
        const SizedBox(height: 39.5,),
        const  GenderSection(),
        const SizedBox(height: 23.5,),
        Text.rich(
          TextSpan(
              text: AppLocalizations.of(context)!.creatingAccountAgreement,
              style: getMediumStyle(color: AppColors.black,
                  fontSize: 14.0
              ),
              children: [
                TextSpan(
                    text: AppLocalizations.of(context)!.termsAndConditions,
                    style: getBoldStyle(
                        color: AppColors.black,
                        fontSize: 14.0
                    ).copyWith(
                        decoration: TextDecoration.underline
                    ),
                    recognizer: TapGestureRecognizer()..onTap=(){
                      //

                    }
                )
              ]
          ),

        ),
        const SizedBox(height: 39.5,),
        ElevatedButton(
            style: ElevatedButton.styleFrom(
                fixedSize: Size(MediaQuery.of(context).size.width,
                    50)
            ),
            onPressed: (){
              cubit.doIntent(intent: RegisterSubmitIntent());
            }, child:
        Text(AppLocalizations.of(context)!.signUp))
      ],
    ),) ,)
 )
    )
    );
  }
}
