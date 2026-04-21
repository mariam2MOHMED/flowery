import 'package:flowerecommeric/core/l10n/app_localizations.dart';
import 'package:flowerecommeric/core/theme/app_colors.dart';
import 'package:flowerecommeric/core/theme/font_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/enum/gender.dart';
import '../../view_model/register/register_cubit.dart';
import '../../view_model/register/register_event.dart';
import '../../view_model/register/register_state.dart';

class GenderSection extends StatelessWidget {
  const GenderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          AppLocalizations.of(context)!.gender,
          style: getBoldStyle(color: AppColors.black, fontSize: 16.0),
        ),
        const SizedBox(width: 32.0),
        BlocSelector<RegisterCubit, RegisterState, Gender>(
          selector: (state) => state.gender,
          builder: (context, gender) {
            return Row(
              children: [
                RadioGroup<Gender>(
                  groupValue: gender,
                  onChanged: (Gender? value) {
                    context.read<RegisterCubit>().doIntent(
                      intent: ChangeGenderIntent(value!),
                    );
                  },
                  child:  Row(
                    children: [
                      const Radio(
                        value: Gender.male,
                        activeColor: AppColors.pink,
                      ),
                      Text(AppLocalizations.of(context)!.male),
                      const SizedBox(width: 16.0),
                      const Radio(
                        value: Gender.female,
                        activeColor: AppColors.pink,
                      ),
                      Text(AppLocalizations.of(context)!.female),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}
