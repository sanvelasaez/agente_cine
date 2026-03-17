import 'package:agente_cine/config/theme/app_dimensions.dart';
import 'package:agente_cine/presentation/screens/favorites/providers/favorites_provider.dart';
import 'package:agente_cine/presentation/shared/widgets/empty_state.dart';
import 'package:agente_cine/presentation/shared/widgets/error_view.dart';
import 'package:agente_cine/presentation/shared/widgets/loading_indicator.dart';
import 'package:agente_cine/presentation/shared/widgets/movie_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Favorites page showing user's favorite movies
class FavoritesPage extends ConsumerWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoritesState = ref.watch(favoritesProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              ref.read(favoritesProvider.notifier).loadFavorites();
            },
          ),
        ],
      ),
      body: favoritesState.when(
        data: (movies) {
          if (movies.isEmpty) {
            return const EmptyState(
              message: 'No favorite movies yet',
              icon: Icons.favorite_border,
            );
          }

          return RefreshIndicator(
            onRefresh: () =>
                ref.read(favoritesProvider.notifier).loadFavorites(),
            child: GridView.builder(
              padding: const EdgeInsets.all(AppDimensions.spacingM),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.6,
                crossAxisSpacing: AppDimensions.spacingM,
                mainAxisSpacing: AppDimensions.spacingM,
              ),
              itemCount: movies.length,
              itemBuilder: (context, index) {
                final movie = movies[index];
                return MovieCard(
                  movie: movie,
                  onTap: () {
                    // TODO: Navigate to movie detail
                  },
                );
              },
            ),
          );
        },
        loading: () => const LoadingIndicator(),
        error: (error, stack) => ErrorView(
          message: error.toString(),
          onRetry: () {
            ref.read(favoritesProvider.notifier).loadFavorites();
          },
        ),
      ),
    );
  }
}
