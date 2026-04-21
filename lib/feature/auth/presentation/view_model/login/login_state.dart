import 'package:equatable/equatable.dart';
import 'package:flowerecommeric/core/state_status/state_status.dart';
import 'package:flowerecommeric/feature/auth/domain/entities/login_entity.dart';
import 'package:flutter/cupertino.dart';

class LoginState extends Equatable{
  final StateStatus<LoginEntity> loginStatus;
  final bool obsecure;
  final AutovalidateMode autovalidateMode;
  final bool rememberMe;
  final bool isFormFilled;
  const LoginState({this.loginStatus=const
  StateStatus.initial(), this.obsecure=true,
    this.isFormFilled=false,
    this.rememberMe=false,
  this.autovalidateMode=AutovalidateMode.disabled});
  LoginState copyWith({
    StateStatus<LoginEntity>? loginStatus,
     bool? obsecure,
    bool? isFormFilled,
    AutovalidateMode? autovalidateMode,
     bool? rememberMe
}){
    return  LoginState(
      loginStatus: loginStatus??this.loginStatus,
      isFormFilled: isFormFilled??this.isFormFilled,
      obsecure: obsecure??this.obsecure,
      rememberMe:rememberMe??this.rememberMe ,
      autovalidateMode: autovalidateMode??this.autovalidateMode
    );
  }
  @override
  List<Object?> get props => [loginStatus,obsecure,isFormFilled
    ,rememberMe,autovalidateMode];

}