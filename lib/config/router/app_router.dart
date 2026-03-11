import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:agente_cine/config/router/app_routes.dart';
import 'package:agente_cine/presentation/features/home/pages/home_page.dart';

/// App router configuration
class AppRouter {
  AppRouter._();

  static final GoRouter router = GoRouter(
    initialLocation: AppRoutes.home,
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
        path: AppRoutes.home,
        name: 'home',
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        path: AppRoutes.movieDetail,
        name: 'movieDetail',
        builder: (context, state) {
          final movieId = state.pathParameters['id']!;
          return _PlaceholderPage(title: 'Movie Detail $movieId');
        },
      ),
      GoRoute(
        path: AppRoutes.favorites,
        name: 'favorites',
        builder: (context, state) => const _PlaceholderPage(title: 'Favorites'),
      ),
      GoRoute(
        path: AppRoutes.categories,
        name: 'categories',
        builder: (context, state) => const _PlaceholderPage(title: 'Categories'),
      ),
      GoRoute(
        path: AppRoutes.categoryMovies,
        name: 'categoryMovies',
        builder: (context, state) {
          final genreId = state.pathParameters['genreId']!;
          return _PlaceholderPage(title: 'Genre $genreId Movies');
        },
      ),
      GoRoute(
        path: AppRoutes.search,
        name: 'search',
        builder: (context, state) => const _PlaceholderPage(title: 'Search'),
      ),
    ],
    errorBuilder: (context, state) => const _ErrorPage(),
  );
}

/// Temporary placeholder page (will be replaced with real pages)
class _PlaceholderPage extends StatelessWidget {
  const _PlaceholderPage({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(
        child: Text(
          title,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
    );
  }
}

/// Error page for 404 and routing errors
class _ErrorPage extends StatelessWidget {
  const _ErrorPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Error')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline, size: 64),
            const SizedBox(height: 16),
            Text(
              '404 - Page not found',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => context.go(AppRoutes.home),
              child: const Text('Go Home'),
            ),
          ],
        ),
      ),
    );
  }
}
