import 'package:flowerecommeric/core/result/result.dart';

import '../../api/models/register/register_request.dart';
import '../../domain/entities/register_entity.dart';

abstract interface class AuthRepo{
  Future<Result<RegisterEntity>>signUp(RegisterRequest request);
}