
import 'package:dio/dio.dart';
import 'package:flowerecommeric/core/local_storage/secure_storage.dart';
import 'package:injectable/injectable.dart';
@lazySingleton
class TokenInterecptor extends Interceptor{
  final SecureStorageService _secureStorageService;
  const TokenInterecptor(this._secureStorageService);
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final token =_secureStorageService.getToken();
    if(token!=null){
      options.headers['Authorization']='Bearer $token';
    }
    super.onRequest(options, handler);
  }
}