import 'package:agente_cine/config/di/injection.dart';
import 'package:agente_cine/domain/entities/movie.dart';
import 'package:agente_cine/domain/failures/failure.dart';
import 'package:agente_cine/domain/usecases/get_favorites.dart';
import 'package:agente_cine/domain/usecases/toggle_favorite.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Provider for favorites list
final favoritesProvider =
    StateNotifierProvider<FavoritesNotifier, AsyncValue<List<Movie>>>(
  (ref) => FavoritesNotifier(
    getFavorites: getIt<GetFavorites>(),
    toggleFavorite: getIt<ToggleFavorite>(),
  )..loadFavorites(),
);

/// Notifier for managing favorites state
class FavoritesNotifier extends StateNotifier<AsyncValue<List<Movie>>> {
  FavoritesNotifier({
    required GetFavorites getFavorites,
    required ToggleFavorite toggleFavorite,
  })  : _getFavorites = getFavorites,
        _toggleFavorite = toggleFavorite,
        super(const AsyncValue.loading());

  final GetFavorites _getFavorites;
  final ToggleFavorite _toggleFavorite;

  /// Load all favorite movies
  Future<void> loadFavorites() async {
    state = const AsyncValue.loading();

    final result = await _getFavorites();

    result.fold(
      (failure) => state = AsyncValue.error(
        failure.userMessage,
        StackTrace.current,
      ),
      (movies) => state = AsyncValue.data(movies),
    );
  }

  /// Toggle favorite status of a movie
  Future<void> toggleFavoriteStatus(Movie movie) async {
    final result = await _toggleFavorite(movie);

    result.fold(
      (failure) {
        // Show error but don't change state
      },
      (isFavorite) {
        // Reload favorites to reflect change
        loadFavorites();
      },
    );
  }

  /// Remove a movie from favorites
  Future<void> removeFavorite(Movie movie) async {
    await toggleFavoriteStatus(movie);
  }
}
