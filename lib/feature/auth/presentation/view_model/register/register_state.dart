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

 const RegisterState({
   this.registerStatus=const StateStatus.initial(),
    this.gender=Gender.male,
    this.isObsecurePass=true,
    this.isObsecureConfirmPass=true});
  RegisterState copyWith({
    StateStatus<RegisterEntity>?registerStatus,
      Gender? gender,
     bool? isObsecurePass,
     bool? isObsecureConfirmPass
}){
    return RegisterState(
      registerStatus: registerStatus??this.registerStatus,
      gender: gender??this.gender,
      isObsecurePass: isObsecurePass??this.isObsecurePass,
      isObsecureConfirmPass: isObsecureConfirmPass??this.isObsecureConfirmPass
    );
}
  @override
  List<Object?> get props => [
    registerStatus,
    gender,
    isObsecurePass,
    isObsecureConfirmPass
  ];



}