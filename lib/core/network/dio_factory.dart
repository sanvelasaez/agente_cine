import 'package:agente_cine/config/constants/api_constants.dart';
import 'package:agente_cine/core/network/logging_interceptor.dart';
import 'package:dio/dio.dart';

/// Factory class for creating configured Dio instances
class DioFactory {
  DioFactory._();

  /// Create a Dio instance with default configuration
  static Dio create() {
    final dio = Dio(
      BaseOptions(
        baseUrl: ApiConstants.baseUrl,
        connectTimeout: const Duration(milliseconds: ApiConstants.defaultTimeout),
        receiveTimeout: const Duration(milliseconds: ApiConstants.defaultTimeout),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        queryParameters: {
          ApiConstants.apiKeyParam: ApiConstants.apiKey,
          ApiConstants.languageParam: ApiConstants.defaultLanguage,
        },
      ),
    );

    // Add interceptors
    dio.interceptors.addAll([
      LoggingInterceptor(),
    ]);

    return dio;
  }
}
