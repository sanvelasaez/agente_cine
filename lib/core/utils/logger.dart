import 'dart:developer' as developer;

import 'package:logging/logging.dart';

/// Custom logger for AgenteCine
/// Provides structured logging with different levels
class AppLogger {
  AppLogger._();

  static final Logger _logger = Logger('AgenteCine');
  static bool _initialized = false;

  /// Initialize the logger with specified level
  static void initialize({Level level = Level.INFO}) {
    if (_initialized) {
      return;
    }

    Logger.root.level = level;
    Logger.root.onRecord.listen((record) {
      developer.log(
        record.message,
        time: record.time,
        level: record.level.value,
        name: record.loggerName,
        error: record.error,
        stackTrace: record.stackTrace,
      );
    });

    _initialized = true;
  }

  /// Log debug message
  static void debug(String message, [Object? error, StackTrace? stackTrace]) {
    _logger.fine(message, error, stackTrace);
  }

  /// Log info message
  static void info(String message, [Object? error, StackTrace? stackTrace]) {
    _logger.info(message, error, stackTrace);
  }

  /// Log warning message
  static void warning(String message, [Object? error, StackTrace? stackTrace]) {
    _logger.warning(message, error, stackTrace);
  }

  /// Log error message
  static void error(String message, [Object? error, StackTrace? stackTrace]) {
    _logger.severe(message, error, stackTrace);
  }

  /// Log network request
  static void logRequest(String method, String url, {Map<String, dynamic>? data}) {
    info('[$method] $url ${data != null ? '- Data: $data' : ''}');
  }

  /// Log network response
  static void logResponse(int statusCode, String url, {dynamic data}) {
    info('[$statusCode] $url ${data != null ? '- Response received' : ''}');
  }
}
