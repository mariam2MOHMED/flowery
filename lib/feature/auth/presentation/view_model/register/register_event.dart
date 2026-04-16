import 'package:flowerecommeric/core/enum/gender.dart';

sealed class RegisterIntent{}
class RegisterInitializationIntent extends RegisterIntent{}
class RegisterSubmitIntent extends RegisterIntent{}
class ChangeGenderIntent extends RegisterIntent{
  final Gender gender;

  ChangeGenderIntent(this.gender);
}
class TogglePasswordVisibilityIntent  extends RegisterIntent{

}
class ToggleConfirmPasswordVisibilityIntent extends RegisterIntent{}