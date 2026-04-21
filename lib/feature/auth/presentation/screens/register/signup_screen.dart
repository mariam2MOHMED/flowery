import 'package:flowerecommeric/core/di/di.dart';
import 'package:flowerecommeric/feature/auth/presentation/widget/register/sign_up_Screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../view_model/register/register_cubit.dart';
import '../../view_model/register/register_event.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create:
        (context)=>getIt<RegisterCubit>()
          ..doIntent(intent:
  const   RegisterInitializationIntent()),
    child: const SignUpScreenBody(),
    );
  }
}
