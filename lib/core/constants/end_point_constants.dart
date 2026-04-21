import 'package:envied/envied.dart';

part 'end_point_constants.g.dart';

@Envied(path: 'env/.env')
abstract class Env {

  @EnviedField(varName: 'API_URL',obfuscate: true)
  static   String apiUrl = _Env.apiUrl;

}
abstract class ApiEndPoints {
  static const String productsByOccasionEndPoint='products?';
  static const String productsEndPoint = 'products';

  static const String authEndPoint = 'auth/';

  static const String loginEndPoint = '/signin';

  static const String signupEndPoint = 'signup/';

  static const String forgetPasswordEndPoint = 'forgotPassword';
  static const String verfiyPasswordEndPoint = 'verifyResetCode';
  //resetPassword
  static const String resetPasswordEndPoint = 'resetPassword';
  static const String cartEndPoint = 'cart';
  static const String editProfileEndPoint = 'auth/editProfile';
  static const String uploadProfileEndPoint = 'auth/upload-photo';
  static const String changePasswordEndPoint = 'auth/change-password';

  //addresses
  static const String addressEndPoint = 'addresses';
  ///logout
  static const String logOutEndPoint = 'logout';

  static const String getUserDataEndPoint = 'profile-data';


  static const String ordersEndPoint = 'orders';
  static const String createCashOrder = 'orders';
  static const String createCardOrder = 'orders/checkout?url=http://localhost:3000';

}