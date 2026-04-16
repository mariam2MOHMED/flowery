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
class RegisterCubit extends Cubit<RegisterState>{
  final RegisterUseCase _registerUseCase;
  RegisterCubit(this._registerUseCase):super (const RegisterState());
  late GlobalKey<FormState> registerFormKey;
  late AutovalidateMode autovalidateMode;
late TextEditingController firstName;


  late TextEditingController lastName;
  late TextEditingController email;
  late TextEditingController password;
  late TextEditingController confirmPassword;
  late TextEditingController phone;

  Future<void> doIntent({required RegisterIntent intent}) 
  async {
    switch(intent){
      
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
    }
  }

  void _init() {
    firstName=TextEditingController();
    lastName=TextEditingController();
    email=TextEditingController();
     password=TextEditingController();
     confirmPassword=TextEditingController();
     phone=TextEditingController();
      registerFormKey=GlobalKey<FormState>();
      autovalidateMode=AutovalidateMode.disabled;

  }

void _selectGender(Gender selectGender){

emit(state.copyWith(
  gender: selectGender
));
}

  void _togglePassword() {

    emit(
      state.copyWith(
        isObsecurePass:!state.isObsecurePass
      )
    );
  }
  void _toggleConfirmPassword() {

    emit(
        state.copyWith(
            isObsecureConfirmPass:!state.isObsecureConfirmPass
        )
    );
  }
void _register()async{
final request=RegisterRequest(
  firstName: firstName.text,
  lastName: lastName.text,
   email: email.text,
  phone: phone.text,
  password: password.text,
  rePassword: confirmPassword.text,
  gender: state.gender.apiValue
);
if (!registerFormKey.currentState!.validate()) {
  autovalidateMode = AutovalidateMode.always;
  return;
}
    final result=await _registerUseCase.signUp(request);
    switch(result){

      case SuccessResult<RegisterEntity>():
        emit(state.copyWith(
          registerStatus: StateStatus.success(result.data)
        ));
      case FailedResult<RegisterEntity>():
        emit(state.copyWith(
            registerStatus: StateStatus.
            failure(ResponseException(message:result.error ))
        ));
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
}