import 'dart:async';
import 'package:flowerecommeric/core/enum/gender.dart';
import 'package:flowerecommeric/core/errors/response_exceptions.dart';
import 'package:flowerecommeric/core/result/result.dart';
import 'package:flowerecommeric/core/state_status/state_status.dart';
import 'package:flowerecommeric/feature/auth/api/models/register/register_request.dart';
import 'package:flowerecommeric/feature/auth/domain/entities/register_entity.dart';
import 'package:flowerecommeric/feature/auth/domain/use_case/register_use_case.dart';
import 'package:flowerecommeric/feature/auth/presentation/view_model/register/register_event.dart';
import 'package:flowerecommeric/feature/auth/presentation/view_model/register/register_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class RegisterCubit extends Cubit<RegisterState> {
  final RegisterUseCase _registerUseCase;

  RegisterCubit(this._registerUseCase) :
        super(const RegisterState()){
    _init();
  }
  late GlobalKey<FormState> registerFormKey;
  late TextEditingController firstName;

  late TextEditingController lastName;
  late TextEditingController email;
  late TextEditingController password;
  late TextEditingController confirmPassword;
  late TextEditingController phone;

  //  Rate limiting
  DateTime? _lastSubmitTime;
  static const int _cooldownSeconds = 3;

  //  Prevent duplicate requests
  bool _isSubmitting = false;

  // Optional: cancel previous request
  Completer<void>? _ongoingRequest;

  Future<void> doIntent({required RegisterIntent intent}) async {
    switch (intent) {
      case RegisterInitializationIntent():
        _init();
      case RegisterSubmitIntent():
        _register();
      case ChangeGenderIntent():
        _selectGender(intent.gender);
      case TogglePasswordVisibilityIntent():
        _togglePassword();
      case ToggleConfirmPasswordVisibilityIntent():
        _toggleConfirmPassword();
      case IsTypingIntent():
       _isTyping();
      case ValidateModeIntent():
        _enableAutoValidateMode();
    }
  }

  void _init() {
    firstName = TextEditingController();
    lastName = TextEditingController();
    email = TextEditingController();
    password = TextEditingController();
    confirmPassword = TextEditingController();
    phone = TextEditingController();
    registerFormKey = GlobalKey<FormState>();
  }

  void _selectGender(Gender selectGender) {
    emit(state.copyWith(gender: selectGender));
  }

  void _togglePassword() {
    emit(state.copyWith(isObsecurePass: !state.isObsecurePass));
  }

  void _toggleConfirmPassword() {
    emit(state.copyWith(isObsecureConfirmPass: !state.isObsecureConfirmPass));
  }

  void _register() async {
    final now = DateTime.now();
    if (_lastSubmitTime != null &&
        now.difference(_lastSubmitTime!).inSeconds < _cooldownSeconds) {
      return; // ignore spam click
    }
    // 2. منع request لو واحد شغال
    if (_isSubmitting) return;
    if (registerFormKey.currentState == null) return;

    if (!registerFormKey.currentState!.validate()) {
    _enableAutoValidateMode();
      return;
    }
    _isSubmitting = true;
    _lastSubmitTime = now;
    // Optional: cancel previous
    _ongoingRequest?.complete();
    _ongoingRequest = Completer<void>();

    final request = RegisterRequest(
      firstName: firstName.text.trim(),
      lastName: lastName.text.trim(),
      email: email.text.trim(),
      phone: phone.text.trim(),
      password: password.text.trim(),
      rePassword: confirmPassword.text.trim(),
      gender: state.gender.apiValue,
    );
    try {
      emit(state.copyWith(
          registerStatus: const StateStatus.loading(),
      ));
      final result = await _registerUseCase.signUp(request);

      switch (result) {
        case SuccessResult<RegisterEntity>():
          emit(
            state.copyWith(registerStatus: StateStatus.success(result.data)),
          );

        case FailedResult<RegisterEntity>():
          emit(
            state.copyWith(
              registerStatus: StateStatus.failure(
                ResponseException(message: result.error),
              ),
            ),
          );
      }
    } catch (e) {
      emit(
        state.copyWith(
          registerStatus: StateStatus.failure(
            ResponseException(message: e.toString()),
          ),
        ),
      );
    } finally {
      _isSubmitting = false;
    }
  }

  @override
  Future<void> close() {
    firstName.dispose();
    lastName.dispose();
    email.dispose();
    password.dispose();
    confirmPassword.dispose();
    phone.dispose();
    return super.close();
  }

  void _isTyping() {
    bool isFilled=firstName.text.trim().isNotEmpty &&
        lastName.text.trim().isNotEmpty&& email.text.trim().isNotEmpty
        &&password.text.trim().isNotEmpty &&confirmPassword.text.trim().isNotEmpty &&
        phone.text.trim().isNotEmpty;
    emit(state.copyWith(
      isFilled: isFilled
    ));

  }

  void _enableAutoValidateMode() {
    emit(state.copyWith(
        autovalidateMode: AutovalidateMode.always));
  }
}
