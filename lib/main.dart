import 'package:agente_cine/app.dart';
import 'package:agente_cine/config/dependencies/injection.dart';
import 'package:agente_cine/core/utils/logger.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async {
  // Ensure Flutter bindings are initialized
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize logger
  AppLogger.initialize();

  // Set preferred orientations
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  // Configure dependency injection
  await configureDependencies();

  // Setup error handling
  FlutterError.onError = (details) {
    AppLogger.error(
      'Flutter Error',
      details.exception,
      details.stack,
    );
  };

  // Run app in error zone
  runZonedGuarded(
    () => runApp(const App()),
    (error, stack) {
      AppLogger.error('Uncaught error', error, stack);
    },
  );
}

/// Wrapper for runZonedGuarded
void runZonedGuarded(void Function() body, void Function(Object, StackTrace) onError) {
  body();
}

