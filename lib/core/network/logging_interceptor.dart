import 'package:dio/dio.dart';

import 'package:agente_cine/core/utils/logger.dart';

/// Custom logging interceptor for Dio requests
class LoggingInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    AppLogger.logRequest(
      options.method,
      options.uri.toString(),
      data: options.data as Map<String, dynamic>?,
    );
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    AppLogger.logResponse(
      response.statusCode ?? 0,
      response.requestOptions.uri.toString(),
      data: response.data,
    );
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    AppLogger.error(
      'HTTP Error: ${err.message}',
      err.error,
      err.stackTrace,
    );
    super.onError(err, handler);
  }
}
