import 'package:freezed_annotation/freezed_annotation.dart';

part 'failure.freezed.dart';

/// Base failure class for domain layer errors
@freezed
class Failure with _$Failure {
  const factory Failure.network([String? message]) = NetworkFailure;

  const factory Failure.server([String? message]) = ServerFailure;

  const factory Failure.cache([String? message]) = CacheFailure;

  const factory Failure.validation([String? message]) = ValidationFailure;

  const factory Failure.notFound([String? message]) = NotFoundFailure;

  const factory Failure.unauthorized([String? message]) = UnauthorizedFailure;

  const factory Failure.timeout([String? message]) = TimeoutFailure;

  const factory Failure.parse([String? message]) = ParseFailure;

  const factory Failure.unknown([String? message]) = UnknownFailure;
}

/// Extension to get user-friendly messages
extension FailureMessage on Failure {
  String get userMessage {
    return when(
      network: (msg) => msg ?? 'Error de conexión. Verifica tu internet.',
      server: (msg) => msg ?? 'Error del servidor. Intenta más tarde.',
      cache: (msg) => msg ?? 'Error al acceder a los datos guardados.',
      validation: (msg) => msg ?? 'Datos inválidos.',
      notFound: (msg) => msg ?? 'No se encontró el recurso solicitado.',
      unauthorized: (msg) => msg ?? 'No autorizado.',
      timeout: (msg) => msg ?? 'La solicitud tardó demasiado.',
      parse: (msg) => msg ?? 'Error al procesar los datos.',
      unknown: (msg) => msg ?? 'Ocurrió un error inesperado.',
    );
  }
}
