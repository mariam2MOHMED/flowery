import 'package:flowerecommeric/core/l10n/app_localizations.dart';
import 'package:flowerecommeric/core/route_manage/app_routes.dart';
import 'package:flowerecommeric/core/theme/app_colors.dart';
import 'package:flowerecommeric/core/theme/font_style.dart';
import 'package:flowerecommeric/feature/auth/presentation/view_model/login/login_cubit.dart';
import 'package:flowerecommeric/feature/auth/presentation/view_model/login/login_intent.dart';
import 'package:flowerecommeric/feature/auth/presentation/view_model/login/login_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RememberMeSection extends StatelessWidget {
  const RememberMeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        BlocSelector<LoginCubit,LoginState,bool>
          (selector: (state)=>state.rememberMe,
            builder: (context,rememberMe){
            return Checkbox(
                activeColor: Colors.pink,
                checkColor: AppColors.white,
                value: rememberMe,
                onChanged: (val){
                  context.read<LoginCubit>().doIntent(
                      intent: const RememberMeIntent());
                });
            }),
        const SizedBox(width: 15.0,),
        Text(AppLocalizations.of(context)!.rememberMe,
        style: getMediumStyle(color: AppColors.black,fontSize: 13.0),),
        const Spacer(),
        TextButton(onPressed: (){
          Navigator.of(context).pushNamed(AppRoutes.forgetPassword);
        }, child:
        Text(AppLocalizations.of(context)!.forgetPassword,
          style: getMediumStyle(
              color: AppColors.black,fontSize: 13.0).copyWith(
            decoration: TextDecoration.underline
          ),),)
      ],
    );
  }
}
