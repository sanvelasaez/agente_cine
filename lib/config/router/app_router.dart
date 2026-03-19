import 'package:agente_cine/config/router/app_routes.dart';
import 'package:agente_cine/domain/entities/genre.dart';
import 'package:agente_cine/presentation/screens/categories/pages/categories_page.dart';
import 'package:agente_cine/presentation/screens/categories/pages/category_movies_page.dart';
import 'package:agente_cine/presentation/screens/favorites/pages/favorites_page.dart';
import 'package:agente_cine/presentation/screens/home/models/movie_category.dart';
import 'package:agente_cine/presentation/screens/home/pages/home_page.dart';
import 'package:agente_cine/presentation/screens/home/pages/see_all_movies_page.dart';
import 'package:agente_cine/presentation/screens/movie_detail/pages/movie_detail_page.dart';
import 'package:agente_cine/presentation/screens/search/pages/search_page.dart';
import 'package:agente_cine/presentation/shared/widgets/scaffold_with_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// App router configuration with persistent bottom navigation
class AppRouter {
  AppRouter._();

  static final GoRouter router = GoRouter(
    initialLocation: AppRoutes.home,
    debugLogDiagnostics: true,
    routes: [
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) =>
            ScaffoldWithNavBar(navigationShell: navigationShell),
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.home,
                name: 'home',
                builder: (context, state) => const HomePage(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.search,
                name: 'search',
                builder: (context, state) => const SearchPage(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.categories,
                name: 'categories',
                builder: (context, state) => const CategoriesPage(),
                routes: [
                  GoRoute(
                    path: ':genreId',
                    name: 'categoryMovies',
                    builder: (context, state) {
                      final genreId =
                          int.parse(state.pathParameters['genreId']!);
                      final genreName =
                          state.uri.queryParameters['name'] ?? 'Unknown';
                      final genre = Genre(id: genreId, name: genreName);
                      return CategoryMoviesPage(genre: genre);
                    },
                  ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.favorites,
                name: 'favorites',
                builder: (context, state) => const FavoritesPage(),
              ),
            ],
          ),
        ],
      ),
      GoRoute(
        path: AppRoutes.movieDetail,
        name: 'movieDetail',
        pageBuilder: (context, state) {
          final movieId = int.parse(state.pathParameters['id']!);
          return CustomTransitionPage(
            key: state.pageKey,
            child: MovieDetailPage(movieId: movieId),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return FadeTransition(
                opacity: CurveTween(curve: Curves.easeInOut).animate(animation),
                child: child,
              );
            },
          );
        },
      ),
      GoRoute(
        path: AppRoutes.seeAll,
        name: 'seeAll',
        builder: (context, state) {
          final categoryName = state.pathParameters['category']!;
          final category = MovieCategory.values.firstWhere(
            (c) => c.name == categoryName,
            orElse: () => MovieCategory.trending,
          );
          return SeeAllMoviesPage(category: category);
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
