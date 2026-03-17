/// Base exception class for application errors
abstract class AppException implements Exception {
  const AppException(this.message);

  final String message;

  @override
  String toString() => message;
}

/// Network-related exceptions
class NetworkException extends AppException {
  const NetworkException([super.message = 'Network error occurred']);
}

/// Server-related exceptions
class ServerException extends AppException {
  const ServerException([super.message = 'Server error occurred']);

  ServerException.withStatusCode(int statusCode)
    : super('Server error: $statusCode');
}

/// Cache-related exceptions
class CacheException extends AppException {
  const CacheException([super.message = 'Cache error occurred']);
}

/// Validation exceptions
class ValidationException extends AppException {
  const ValidationException([super.message = 'Validation error occurred']);
}

/// Not found exceptions
class NotFoundException extends AppException {
  const NotFoundException([super.message = 'Resource not found']);
}

/// Unauthorized exceptions
class UnauthorizedException extends AppException {
  const UnauthorizedException([super.message = 'Unauthorized access']);
}

/// Timeout exceptions
class TimeoutException extends AppException {
  const TimeoutException([super.message = 'Request timeout']);
}

/// Parse exceptions
class ParseException extends AppException {
  const ParseException([super.message = 'Failed to parse data']);
}
