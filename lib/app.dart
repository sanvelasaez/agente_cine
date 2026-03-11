import 'package:agente_cine/config/router/app_router.dart';
import 'package:agente_cine/config/theme/app_theme.dart';
import 'package:agente_cine/core/utils/logger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Main application widget
class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp.router(
        title: 'AgenteCine',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.darkTheme,
        routerConfig: AppRouter.router,
        builder: (context, child) {
          // Log navigation events
          AppRouter.router.routerDelegate.addListener(() {
            final location = AppRouter.router.routerDelegate.currentConfiguration;
            AppLogger.info('Navigation: ${location.uri}');
          });
          return child ?? const SizedBox.shrink();
        },
      ),
    );
  }
}
