import 'package:flowerecommeric/core/errors/response_exceptions.dart';
import 'package:flowerecommeric/core/result/result.dart';
import 'package:flowerecommeric/core/state_status/state_status.dart';
import 'package:flowerecommeric/feature/auth/api/models/login/login_request.dart';
import 'package:flowerecommeric/feature/auth/domain/entities/login_entity.dart';
import 'package:flowerecommeric/feature/auth/domain/use_case/login_use_case.dart';
import 'package:flowerecommeric/feature/auth/presentation/view_model/login/login_intent.dart';
import 'package:flowerecommeric/feature/auth/presentation/view_model/login/login_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/local_storage/secure_storage.dart';

@injectable
class LoginCubit extends Cubit<LoginState> {
  final LoginUseCase _loginUseCase;
  final SecureStorageService _storage;

  LoginCubit(this._loginUseCase,this._storage) :
        super(const LoginState()){
    _init();
  }
  late TextEditingController email;
  late TextEditingController password;
  late GlobalKey<FormState> loginFormKey;

  Future<void> doIntent({required LoginIntent intent}) async {
    switch (intent) {
      case LoginInitializationIntent():
     break;
      case TogglePasswordVisibilityIntent():
        _togglePasswordVisibility();
      case LoginSubmitIntent():
        _login();
      case RememberMeIntent():
        _toggleRememberMe();
      case FormChangedIntent():
        _formChanged();
    }
  }

  Future<void> _init() async {
    email = TextEditingController();
    password = TextEditingController();
    loginFormKey = GlobalKey<FormState>();
    email.addListener(_formChanged);
    password.addListener(_formChanged);

    final rememberMe = await _storage.getRememberMe();
    final savedEmail = await _storage.getEmail();

    if (rememberMe && savedEmail != null) {
      email.text = savedEmail;
    }

    emit(state.copyWith(rememberMe: rememberMe));
  }

  @override
  Future<void> close() {
    email.dispose();
    password.dispose();
    email.removeListener(_formChanged);
    password.removeListener(_formChanged);
    return super.close();
  }

  void _togglePasswordVisibility() {
    emit(state.copyWith(obsecure: !state.obsecure));
  }

  Future<void> _login() async {
    final request = LoginRequest(
      email: email.text.trim(),
      password: password.text.trim(),
    );

    if (loginFormKey.currentState == null) return;

    if (!loginFormKey.currentState!.validate()) {
      emit(state.copyWith(
        autovalidateMode: AutovalidateMode.always,
      ));
      return;
    }
    emit(state.copyWith(
        loginStatus: const StateStatus.loading()));
    final result = await _loginUseCase.login(request);

    switch (result) {
      case SuccessResult<LoginEntity>():
        final token=result.data.token;
        if(state.rememberMe){
          await _storage.saveToken(token);
          await _storage.saveEmail(email.text.trim());
          await _storage.saveRememberMe(true);
        }else {
          await _storage.clearAll();
          await _storage.saveToken(token);

        }
        emit(state.copyWith(
            loginStatus: StateStatus.success(result.data)));
      case FailedResult<LoginEntity>():
        emit(
          state.copyWith(
            loginStatus: StateStatus.failure(
              ResponseException(message: result.error),
            ),
          ),
        );
    }
  }

  Future<void> _toggleRememberMe() async{
    final newValue=!state.rememberMe;
   await _storage.saveRememberMe(newValue);
   emit(state.copyWith(
     rememberMe: newValue
   ));
  }

  void _formChanged() {
    final filled=email.text.trim().isNotEmpty &&
        password.text.trim().isNotEmpty;
 if(filled!=state.isFormFilled){
   emit(state.copyWith(
       isFormFilled: filled
   ));
 }
  }
}
