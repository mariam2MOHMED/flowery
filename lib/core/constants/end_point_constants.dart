import 'package:envied/envied.dart';

part 'end_point_constants.g.dart';

@Envied(path: 'env/.env')
abstract class Env {

  @EnviedField(varName: 'API_URL',obfuscate: true)
  static final String apiUrl = _Env.apiUrl;

  @EnviedField(varName: 'PRODUCTS_ENDPOINT',obfuscate: true)
  static  String products = _Env.products;

  @EnviedField(varName: 'PRODUCTS_BY_OCCASION_ENDPOINT',obfuscate: true)
  static  String productsByOccasion = _Env.productsByOccasion;

  @EnviedField(varName: 'AUTH_ENDPOINT',obfuscate: true)
  static  String auth = _Env.auth;

  @EnviedField(varName: 'LOGIN_ENDPOINT',obfuscate: true)
  static  String login = _Env.login;

  @EnviedField(varName: 'SIGNUP_ENDPOINT',obfuscate: true)
  static  String signup = _Env.signup;

  @EnviedField(varName: 'FORGET_PASSWORD_ENDPOINT',obfuscate: true)
  static  String forgetPassword = _Env.forgetPassword;

  @EnviedField(varName: 'VERIFY_PASSWORD_ENDPOINT',obfuscate: true)
  static  String verifyPassword = _Env.verifyPassword;

  @EnviedField(varName: 'RESET_PASSWORD_ENDPOINT',obfuscate: true)
  static  String resetPassword = _Env.resetPassword;


  @EnviedField(varName: 'CART_ENDPOINT',obfuscate: true)
  static  String cart = _Env.cart;


  @EnviedField(varName: 'EDIT_PROFILE_ENDPOINT',obfuscate: true)
  static  String editProfile = _Env.editProfile;

  @EnviedField(varName: 'UPLOAD_PROFILE_ENDPOINT',obfuscate: true)
  static  String uploadProfile = _Env.uploadProfile;

  @EnviedField(varName: 'CHANGE_PASSWORD_ENDPOINT',obfuscate: true)
  static  String changePassword = _Env.changePassword;

  @EnviedField(varName: 'GET_USER_DATA_ENDPOINT',obfuscate: true)
  static  String getUserData = _Env.getUserData;


  @EnviedField(varName: 'ADDRESS_ENDPOINT',obfuscate: true)
  static  String address = _Env.address;


  @EnviedField(varName: 'LOGOUT_ENDPOINT',obfuscate: true)
  static  String logout = _Env.logout;


  @EnviedField(varName: 'ORDERS_ENDPOINT',obfuscate: true)
  static  String orders = _Env.orders;

  @EnviedField(varName: 'CREATE_CASH_ORDER',obfuscate: true)
  static  String createCashOrder = _Env.createCashOrder;

  @EnviedField(varName: 'CREATE_CARD_ORDER',obfuscate: true)
  static  String createCardOrder = _Env.createCardOrder;
}