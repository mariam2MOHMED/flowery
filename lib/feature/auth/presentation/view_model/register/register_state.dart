import 'package:equatable/equatable.dart';
import 'package:flowerecommeric/core/state_status/state_status.dart';
import 'package:flowerecommeric/feature/auth/domain/entities/register_entity.dart';
import 'package:flutter/cupertino.dart';

import '../../../../../core/enum/gender.dart';

class RegisterState extends Equatable{
  final StateStatus<RegisterEntity>registerStatus;
  final  Gender gender;
  final bool isObsecurePass;
  final bool isObsecureConfirmPass;
final AutovalidateMode autovalidateMode;
final bool isFilled;
 const RegisterState( {
   this.registerStatus=const StateStatus.initial(),
    this.gender=Gender.male,
    this.isObsecurePass=true,
    this.isObsecureConfirmPass=true,
   this.isFilled=false,
   this.autovalidateMode=AutovalidateMode.disabled
 });
  RegisterState copyWith({
    StateStatus<RegisterEntity>?registerStatus,
      Gender? gender,
     bool? isObsecurePass,
    bool? isFilled,
     bool? isObsecureConfirmPass,
    AutovalidateMode? autovalidateMode
}){
    return RegisterState(
      registerStatus: registerStatus??this.registerStatus,
      gender: gender??this.gender,
      isFilled:isFilled??this.isFilled ,
      isObsecurePass: isObsecurePass??this.isObsecurePass,
      isObsecureConfirmPass: isObsecureConfirmPass??this.isObsecureConfirmPass,
    autovalidateMode: autovalidateMode??this.autovalidateMode
    );
}
  @override
  List<Object?> get props => [
    registerStatus,
    gender,
    isObsecurePass,
    isObsecureConfirmPass,
    autovalidateMode,
    isFilled
  ];



}