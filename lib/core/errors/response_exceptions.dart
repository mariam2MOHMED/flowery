import 'package:equatable/equatable.dart';
import 'package:dio/dio.dart';
import 'package:flowerecommeric/core/constants/exception_constants.dart';

class ResponseException extends Equatable implements Exception {
  final String message;

  const ResponseException({required this.message});

  static ResponseException empty() =>
      ResponseException(message: ExceptionConstants.noResponseReceivedMessage.trim());

  factory ResponseException.handleException({required Response? response}) {
    if (response != null && response.data is Map<String, dynamic>) {
      final data = response.data as Map<String, dynamic>;
      return ResponseException(
        message: data['error'].toString() ,
      );
    } else {
      return empty();
    }
  }

  @override
  List<Object?> get props => [message];
}