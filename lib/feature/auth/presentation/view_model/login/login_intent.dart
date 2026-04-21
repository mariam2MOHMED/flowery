sealed class LoginIntent{
  const LoginIntent();
}
final class LoginInitializationIntent extends
LoginIntent{
  const LoginInitializationIntent();
}
final class TogglePasswordVisibilityIntent extends
LoginIntent{
  const TogglePasswordVisibilityIntent();
}
final class RememberMeIntent extends
LoginIntent{
  const RememberMeIntent();
}
final class LoginSubmitIntent extends
LoginIntent{
  const LoginSubmitIntent();
}
class FormChangedIntent extends
LoginIntent {
  const FormChangedIntent(); }