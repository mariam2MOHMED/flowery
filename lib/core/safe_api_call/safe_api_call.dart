import 'package:dio/dio.dart';

import '../errors/api_errors.dart';
import '../errors/response_exceptions.dart';
import '../result/result.dart';

Future<Result<T>> safeApiCall<T>(Future<T> Function() call) async {
  try {
    final response = await call();
    return SuccessResult(response);
  } on Exception catch (error) {
    if (error is DioException) {
      return FailedResult(ServerFailure.fromDioError(error).error);
    } else if (error is ResponseException) {
      return FailedResult(ResponseException(
          message: error.toString()).message);
    } else {
      return FailedResult(error.toString());
    }
  } catch (error) {
    return FailedResult(error.toString());
  }
}