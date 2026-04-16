import 'package:equatable/equatable.dart';
import 'package:flowerecommeric/feature/auth/domain/entities/user_entity.dart';

class RegisterEntity extends Equatable{
  final String message;
  final UserEntity user;
  final String token;

 const RegisterEntity({
    required this.message,
    required this.user,
    required this.token,
  });

  @override
  List<Object?> get props => [message,user,token];
}