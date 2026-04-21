 import 'package:flowerecommeric/core/result/result.dart';
import 'package:flowerecommeric/feature/auth/api/models/login/login_request.dart';

import '../../api/models/register/register_request.dart';
import '../../domain/entities/login_entity.dart';
import '../../domain/entities/register_entity.dart';

abstract interface class AuthRemoteDataSource{
  Future<Result<RegisterEntity>>signUp(RegisterRequest request);
  Future<Result<LoginEntity>>login(LoginRequest request);
}