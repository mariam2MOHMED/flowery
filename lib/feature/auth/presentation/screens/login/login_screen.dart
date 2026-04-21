import 'package:flowerecommeric/core/di/di.dart';
import 'package:flowerecommeric/feature/auth/presentation/view_model/login/login_cubit.dart';
import 'package:flowerecommeric/feature/auth/presentation/view_model/login/login_intent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/l10n/app_localizations.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../widget/login/login_view_body.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.arrow_back_ios,
          color: AppColors.txtBlack,
          size: 20.0,
        ),
        title: Text(AppLocalizations.of(context)!.login),
      ),
      body: BlocProvider(
        create: (_) => getIt<LoginCubit>()..doIntent(intent: const LoginInitializationIntent()),
        child: const LoginViewBody(),
      ),
    );
  }
}
