import 'package:flowerecommeric/core/result/result.dart';
import 'package:flowerecommeric/core/safe_api_call/safe_api_call.dart';
import 'package:flowerecommeric/feature/auth/api/client/auth_api_services.dart';
import 'package:flowerecommeric/feature/auth/api/models/login/login_request.dart';
import 'package:flowerecommeric/feature/auth/api/models/register/register_request.dart';
import 'package:flowerecommeric/feature/auth/domain/entities/login_entity.dart';
import 'package:flowerecommeric/feature/auth/domain/entities/register_entity.dart';
import 'package:injectable/injectable.dart';

import '../../data/data_source/auth_data_source.dart';
@Injectable(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements  AuthRemoteDataSource{
  final AuthApiServices _authApiServices;
  const AuthRemoteDataSourceImpl(this._authApiServices);
  @override
  Future<Result<RegisterEntity>> signUp(RegisterRequest request) {
   return safeApiCall(()async{
     final register=await _authApiServices.signUp(request);
     return register.toEntity();
   });
  }

  @override
  Future<Result<LoginEntity>> login(LoginRequest request) {
   return safeApiCall(()async{
     final login=await _authApiServices.login(request);
     return login.toEntity();
   });
  }

}