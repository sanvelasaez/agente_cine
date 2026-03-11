import 'package:agente_cine/config/router/app_routes.dart';
import 'package:agente_cine/domain/entities/genre.dart';
import 'package:agente_cine/presentation/features/categories/pages/categories_page.dart';
import 'package:agente_cine/presentation/features/categories/pages/category_movies_page.dart';
import 'package:agente_cine/presentation/features/favorites/pages/favorites_page.dart';
import 'package:agente_cine/presentation/features/home/pages/home_page.dart';
import 'package:agente_cine/presentation/features/movie_detail/pages/movie_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
          final movieId = int.parse(state.pathParameters['id']!);
          return MovieDetailPage(movieId: movieId);
        },
      ),
      GoRoute(
        path: AppRoutes.favorites,
        name: 'favorites',
        builder: (context, state) => const FavoritesPage(),
      ),
      GoRoute(
        path: AppRoutes.categories,
        name: 'categories',
        builder: (context, state) => const CategoriesPage(),
      ),
      GoRoute(
        path: AppRoutes.categoryMovies,
        name: 'categoryMovies',
        builder: (context, state) {
          final genreId = int.parse(state.pathParameters['genreId']!);
          final genreName = state.uri.queryParameters['name'] ?? 'Unknown';
          final genre = Genre(id: genreId, name: genreName);
          return CategoryMoviesPage(genre: genre);
        },
      ),
    ],
    errorBuilder: (context, state) => const _ErrorPage(),
  );
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
