import 'dart:io';
import 'package:dio/dio.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'Failure.dart';

class ApiErrorHandler {
  const ApiErrorHandler._();

  static Failure handle(Object error, {StackTrace? stackTrace}) {
    if (error is Failure) {
      return error;
    }

    if (error is AuthException) {
      return AuthFailure(
        message: error.message,
        statusCode: error.statusCode == null
            ? null
            : int.tryParse(error.statusCode!),
        stackTrace: stackTrace,
      );
    }

    if (error is PostgrestException) {
      return ServerFailure(
        message: error.message,
        statusCode: error.code == null ? null : int.tryParse(error.code!),
        stackTrace: stackTrace,
      );
    }

    if (error is StorageException) {
      return ServerFailure(
        message: error.message,
        statusCode: error.statusCode == null
            ? null
            : int.tryParse(error.statusCode!),
        stackTrace: stackTrace,
      );
    }

    if (error is DioException) {
      return _dioHandler(error, stackTrace);
    }

    if (error is SocketException) {
      return NetworkFailure(
        message: 'No Internet Connection',
        stackTrace: stackTrace,
      );
    }

    return UnknownFailure(message: error.toString(), stackTrace: stackTrace);
  }

  static Failure _dioHandler(DioException error, StackTrace? stackTrace) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return NetworkFailure(
          message: 'Connection Timeout',
          stackTrace: stackTrace,
        );

      case DioExceptionType.sendTimeout:
        return NetworkFailure(message: 'Send Timeout', stackTrace: stackTrace);

      case DioExceptionType.receiveTimeout:
        return NetworkFailure(
          message: 'Receive Timeout',
          stackTrace: stackTrace,
        );

      case DioExceptionType.connectionError:
        return NetworkFailure(
          message: 'Connection Error',
          stackTrace: stackTrace,
        );

      case DioExceptionType.badCertificate:
        return ServerFailure(
          message: 'Bad Certificate',
          stackTrace: stackTrace,
        );

      case DioExceptionType.cancel:
        return ServerFailure(
          message: 'Request Cancelled',
          stackTrace: stackTrace,
        );

      case DioExceptionType.badResponse:
        return ServerFailure(
          message: _extractMessage(error.response?.data),
          statusCode: error.response?.statusCode,
          stackTrace: stackTrace,
        );

      case DioExceptionType.unknown:
        return UnknownFailure(
          message: error.message ?? 'Unknown Error',
          stackTrace: stackTrace,
        );
      case DioExceptionType.transformTimeout:
        return NetworkFailure(
          message: 'Transform Timeout',
          stackTrace: stackTrace,
        );
    }
  }

  static String _extractMessage(dynamic data) {
    if (data is Map<String, dynamic>) {
      return data['message'] ??
          data['error'] ??
          data['detail'] ??
          'Unknown Server Error';
    }

    return 'Unknown Server Error';
  }
}
