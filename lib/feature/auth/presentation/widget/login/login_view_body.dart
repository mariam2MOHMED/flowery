import 'package:flowerecommeric/core/theme/app_colors.dart';
import 'package:flowerecommeric/feature/auth/presentation/view_model/login/login_cubit.dart';
import 'package:flowerecommeric/feature/auth/presentation/view_model/login/login_intent.dart';
import 'package:flowerecommeric/feature/auth/presentation/view_model/login/login_state.dart';
import 'package:flowerecommeric/feature/auth/presentation/widget/login/remember_me_section.dart';
import 'package:flowerecommeric/feature/auth/presentation/widget/login/user_login_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../../../core/common_widget/snack_bar_widgets.dart';
import '../../../../../core/l10n/app_localizations.dart';
import 'donot_have_account_section.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return
  Padding(padding: const EdgeInsetsDirectional.
  symmetric(
    horizontal: 16.0,vertical: 32.0
  ),child:
  BlocListener<LoginCubit,LoginState>
    (
      listenWhen: (prev,curr)=>prev.loginStatus!=curr.loginStatus,
      listener: (context,state){
    if (state.loginStatus.isSuccess) {
      SnackBarWidgets.showSuccessMessage(
        message: AppLocalizations.of(context)!.loginSuccess,
        context: context,
      );
    }
    if (state.loginStatus.isFailure) {
      SnackBarWidgets.showErrorMessage(
        message: state.loginStatus.error!.message,
        context: context,
      );
    }
  },child:
BlocBuilder<LoginCubit,LoginState>(
    buildWhen: (prev,curr)=>prev.autovalidateMode!=curr.autovalidateMode
    ||   prev.loginStatus != curr.loginStatus,


    builder: (context,state){
  final cubit= context.read<LoginCubit>();

  return Form(
    key: cubit.loginFormKey,
     autovalidateMode: state.autovalidateMode,
    child:   Column(
      children: [
        UserLoginInfo(email: cubit.email,
            pssword: cubit.password),
        const SizedBox(height: 20.0,),
        const RememberMeSection(),
        const SizedBox(height: 63.0,),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(double.infinity, 50),
          ),
          onPressed:state.isFormFilled
              ?  (){
            context.read<LoginCubit>().doIntent(
                intent: const LoginSubmitIntent());
          }:null,
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 200),
            switchInCurve: Curves.easeInOut,
            switchOutCurve: Curves.easeInBack,
            child:
            cubit.state.loginStatus.isLoading

                ? SizedBox(
              width: 24.0,
              height: 24.0,
              key: const ValueKey('loading'),
              child: LoadingAnimationWidget.inkDrop(
                color: AppColors.white,
                size: 20.0,
              ),
            )
                : Text(
                key: const ValueKey('login') ,
                AppLocalizations.of(context)!.login),
          ),),
        const SizedBox(height: 16.0,),
        ElevatedButton(
            style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
                backgroundColor: AppColors.white,
                foregroundColor: AppColors.black,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusDirectional.circular(
                        24.0),

                    side: const BorderSide(
                      width: 1.2,
                    )
                )
            ),
            onPressed: (){},
            child: Text(AppLocalizations.of(context)!.continueAsGuest)),
        const SizedBox(height: 16.0,),

        const   DonotHaveAccountSection(),
      ],
    ),);
})
  ),)
    ;
  }
}
