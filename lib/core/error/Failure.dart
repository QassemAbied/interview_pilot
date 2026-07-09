abstract class Failure {
  final String message;
  final int? statusCode;
  final StackTrace? stackTrace;

  const Failure({required this.message, this.statusCode, this.stackTrace});
}

class ServerFailure extends Failure {
  const ServerFailure({
    required super.message,
    super.statusCode,
    super.stackTrace,
  });
}

class NetworkFailure extends Failure {
  const NetworkFailure({required super.message, super.stackTrace});
}

class AuthFailure extends Failure {
  const AuthFailure({
    required super.message,
    super.statusCode,
    super.stackTrace,
  });
}

class CacheFailure extends Failure {
  const CacheFailure({required super.message, super.stackTrace});
}

class UnknownFailure extends Failure {
  const UnknownFailure({required super.message, super.stackTrace});
}
