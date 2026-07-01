class ApiException implements Exception {
  final String message;
  final int? statusCode;

  ApiException(this.message, {this.statusCode});

  @override
  String toString() => 'ApiException: $message (StatusCode: $statusCode)';
}

class BadRequestException extends ApiException {
  BadRequestException(String message, {int? statusCode = 400}) : super(message, statusCode: statusCode);
}

class UnauthorizedException extends ApiException {
  UnauthorizedException(String message, {int? statusCode = 401}) : super(message, statusCode: statusCode);
}

class ServerException extends ApiException {
  ServerException(String message, {int? statusCode = 500}) : super(message, statusCode: statusCode);
}
