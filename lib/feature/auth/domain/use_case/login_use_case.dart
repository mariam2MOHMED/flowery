import 'package:flowerecommeric/feature/auth/data/repo/auth_repo.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/result/result.dart';
import '../../api/models/login/login_request.dart';
import '../entities/login_entity.dart';

@injectable
class LoginUseCase{
  final AuthRepo _authRepo;
  const LoginUseCase(this._authRepo);
  Future<Result<LoginEntity>> login
      (LoginRequest request)async{
    return await _authRepo.login(request);
  }
}