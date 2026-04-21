import 'package:flowerecommeric/core/result/result.dart';
import 'package:flowerecommeric/feature/auth/api/models/login/login_request.dart';
import 'package:flowerecommeric/feature/auth/data/data_source/auth_data_source.dart';
import 'package:flowerecommeric/feature/auth/domain/entities/login_entity.dart';
import 'package:injectable/injectable.dart';

import '../../api/models/register/register_request.dart';
import '../../data/repo/auth_repo.dart';
import '../../domain/entities/register_entity.dart';
@Injectable(as: AuthRepo)
 class AuthRepoImpl implements AuthRepo{
  final AuthRemoteDataSource _remoteDataSource;

 const AuthRepoImpl(this._remoteDataSource);

  @override
  Future<Result<RegisterEntity>> signUp(RegisterRequest request)async {
   return await _remoteDataSource.signUp(request);
  }

  @override
  Future<Result<LoginEntity>> login(LoginRequest request)async {
   return await _remoteDataSource.login(request);
  }
}