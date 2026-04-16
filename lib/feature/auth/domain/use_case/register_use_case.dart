import 'package:flowerecommeric/feature/auth/data/repo/auth_repo.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/result/result.dart';
import '../../api/models/register/register_request.dart';
import '../entities/register_entity.dart';

@injectable
class RegisterUseCase{
  final AuthRepo _authRepo;

  const RegisterUseCase(this._authRepo);
  Future<Result<RegisterEntity>> signUp(RegisterRequest request)async {
    return await _authRepo.signUp(request);
  }
}