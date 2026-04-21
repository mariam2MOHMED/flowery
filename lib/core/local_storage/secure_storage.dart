import 'package:flowerecommeric/core/constants/constants.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class SecureStorageService {
  final FlutterSecureStorage _storage = const FlutterSecureStorage();



  Future<void> saveRememberMe(bool value) async {
    await _storage.write(key: Constants.rememberMeKey, value: value.toString());
  }

  Future<bool> getRememberMe() async {
    final value = await _storage.read(key: Constants.rememberMeKey);
    return value == 'true';
  }

  Future<void> saveEmail(String email) async {
    await _storage.write(key: Constants.emailKey, value: email);
  }

  Future<String?> getEmail() async {
    return await _storage.read(key: Constants.emailKey);
  }

  Future<void> saveToken(String token) async {
    await _storage.write(key: Constants.tokenKey, value: token);
  }

  Future<String?> getToken() async {
    return await _storage.read(key: Constants.tokenKey);
  }

  Future<void> clearAll() async {
    await _storage.deleteAll();
  }
}