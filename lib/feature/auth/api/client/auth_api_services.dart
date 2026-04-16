import 'package:dio/dio.dart';
import 'package:flowerecommeric/feature/auth/api/models/register/register_request.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../core/constants/end_point_constants.dart';
import '../models/register/register_response.dart';

part 'auth_api_services.g.dart';

@RestApi()
@injectable
abstract class AuthApiServices{
@factoryMethod
factory AuthApiServices(Dio dio)=_AuthApiServices;
@POST(ApiEndPoints.authEndPoint+ApiEndPoints.signupEndPoint)
  Future<RegisterResponse>signUp(@Body() RegisterRequest request);
}