import 'package:dio/dio.dart';
import 'package:flowerecommeric/core/di/di.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

@module
abstract class DioModule{
  @lazySingleton
  Dio provideDio(){
    final dio= Dio(

    );
    dio.options.headers={
      'Content-Type':'application/json'
    };
    dio.interceptors.add(getIt<PrettyDioLogger>());
  return dio;
  }
  @lazySingleton
  PrettyDioLogger providePrettyDio(){
    return PrettyDioLogger(
      responseHeader: true,
      requestHeader: true,

      responseBody: true,
      request: true,
      requestBody: true,
    );
  }
}