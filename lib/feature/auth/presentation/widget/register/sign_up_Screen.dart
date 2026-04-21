import 'package:flowerecommeric/core/common_widget/snack_bar_widgets.dart';
import 'package:flowerecommeric/core/theme/app_colors.dart';
import 'package:flowerecommeric/core/theme/font_style.dart';
import 'package:flowerecommeric/feature/auth/presentation/widget/register/gender_section.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../../../../../core/l10n/app_localizations.dart';
import '../../../../../core/route_manage/app_routes.dart';
import '../../view_model/register/register_cubit.dart';
import '../../view_model/register/register_event.dart';
import '../../view_model/register/register_state.dart';
import 'sign_up_user_info.dart';

class SignUpScreenBody extends StatelessWidget {
  const SignUpScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<RegisterCubit>();
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.arrow_back_ios,
          color: AppColors.txtBlack,
          size: 20.0,
        ),
        title: Text(AppLocalizations.of(context)!.signUp),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsetsDirectional.symmetric(
            horizontal: 16.0,
            vertical: 24.0,
          ),
          child: BlocListener<RegisterCubit, RegisterState>(

            listener: (context, state)async {
              if (state.registerStatus.isSuccess) {
                SnackBarWidgets.showSuccessMessage(
                  message: AppLocalizations.of(context)!.registerSuccess,
                  context: context,
                );
                await Future.delayed(const Duration(seconds: 3));

                if (context.mounted) {
                  Navigator.of(context).pushNamed(AppRoutes.login);
                }
              }
              if (state.registerStatus.isFailure) {
                SnackBarWidgets.showErrorMessage(
                  message: state.registerStatus.error!.message,
                  context: context,
                );
              }
            },
            child:  Form(
              key: cubit.registerFormKey,
              autovalidateMode: cubit.state.autovalidateMode,
              child: Column(
                children: [
                  SignUpUserInfo(
                    firstName: cubit.firstName,
                    lastName: cubit.lastName,
                    email: cubit.email,
                    phone: cubit.phone,
                    password: cubit.password,
                    confirmPassword: cubit.confirmPassword,
                    onChanged: (_){
                      cubit.doIntent(intent: const IsTypingIntent());
                    },
                  ),
                  const SizedBox(height: 39.5),
                  const GenderSection(),
                  const SizedBox(height: 23.5),
                  Text.rich(
                    TextSpan(
                      text: AppLocalizations.of(
                        context,
                      )!.creatingAccountAgreement,
                      style: getMediumStyle(
                        color: AppColors.black,
                        fontSize: 14.0,
                      ),
                      children: [
                        TextSpan(
                          text: AppLocalizations.of(
                            context,
                          )!.termsAndConditions,
                          style: getBoldStyle(
                            color: AppColors.black,
                            fontSize: 14.0,
                          ).copyWith(decoration: TextDecoration.underline),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.of(context).pushNamed(AppRoutes.login);

                            },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 39.5),
                  BlocSelector<RegisterCubit, RegisterState,
                      ({bool isFilled, bool isLoading})>(
                    selector: (state) => (
                    isFilled: state.isFilled,
                    isLoading: state.registerStatus.isLoading,
                    ),
                    builder: (context, data) {
                      return ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(double.infinity, 50),
                        ),
                        onPressed: data.isFilled && !data.isLoading
                            ? () {
                          cubit.doIntent(
                              intent: const RegisterSubmitIntent());
                        }
                            : null,
                        child: AnimatedSwitcher(
                          duration: const Duration(seconds:
                          2),
                          switchInCurve: Curves.easeInOut,
                          switchOutCurve: Curves.easeInBack,
                          child: data.isLoading
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
                            key: const ValueKey('signUp'),
                            AppLocalizations.of(context)!.signUp,
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            )

          ),
        ),
      ),
    );
  }
}
