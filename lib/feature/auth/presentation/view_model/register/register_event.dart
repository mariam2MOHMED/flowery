import 'package:flowerecommeric/core/enum/gender.dart';

sealed class RegisterIntent{
  const RegisterIntent();
}
final class RegisterInitializationIntent extends
RegisterIntent{
  const RegisterInitializationIntent();
}
final class RegisterSubmitIntent extends RegisterIntent{
  const RegisterSubmitIntent();
}
final class ChangeGenderIntent extends RegisterIntent{
  final Gender gender;

  ChangeGenderIntent(this.gender);
}
final class TogglePasswordVisibilityIntent  extends RegisterIntent{
const TogglePasswordVisibilityIntent();
}
final class ToggleConfirmPasswordVisibilityIntent
    extends RegisterIntent{
  const ToggleConfirmPasswordVisibilityIntent();
}
final class ValidateModeIntent
    extends RegisterIntent{
  const ValidateModeIntent();
}
final class IsTypingIntent
    extends RegisterIntent{
  const IsTypingIntent();
}