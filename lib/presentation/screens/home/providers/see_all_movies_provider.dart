import 'package:agente_cine/config/dependencies/injection.dart';
import 'package:agente_cine/domain/actions/get_now_playing_movies.dart';
import 'package:agente_cine/domain/actions/get_popular_movies.dart';
import 'package:agente_cine/domain/actions/get_top_rated_movies.dart';
import 'package:agente_cine/domain/actions/get_trending_movies.dart';
import 'package:agente_cine/domain/actions/get_upcoming_movies.dart';
import 'package:agente_cine/domain/entities/movie.dart';
import 'package:agente_cine/domain/errors/failure.dart';
import 'package:agente_cine/presentation/screens/home/models/movie_category.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Provider for see-all movies grid, parameterized by category
final seeAllMoviesProvider = StateNotifierProvider.family<
    SeeAllMoviesNotifier, AsyncValue<List<Movie>>, MovieCategory>(
  (ref, category) {
    return SeeAllMoviesNotifier(category: category)..loadMovies();
  },
);

/// Notifier for managing see-all movies state with pagination
class SeeAllMoviesNotifier extends StateNotifier<AsyncValue<List<Movie>>> {
  SeeAllMoviesNotifier({required this.category})
      : super(const AsyncValue.loading());

  final MovieCategory category;
  int _currentPage = 1;
  List<Movie> _allMovies = [];

  Future<Either<Failure, List<Movie>>> _fetchByCategory(int page) {
    switch (category) {
      case MovieCategory.trending:
        return getIt<GetTrendingMovies>()(page: page);
      case MovieCategory.popular:
        return getIt<GetPopularMovies>()(page: page);
      case MovieCategory.topRated:
        return getIt<GetTopRatedMovies>()(page: page);
      case MovieCategory.upcoming:
        return getIt<GetUpcomingMovies>()(page: page);
      case MovieCategory.nowPlaying:
        return getIt<GetNowPlayingMovies>()(page: page);
    }
  }

  /// Load first page of movies
  Future<void> loadMovies() async {
    state = const AsyncValue.loading();
    _currentPage = 1;
    _allMovies = [];

    final result = await _fetchByCategory(_currentPage);

    result.fold(
      (failure) =>
          state = AsyncValue.error(failure.userMessage, StackTrace.current),
      (movies) {
        _allMovies = movies;
        state = AsyncValue.data(_allMovies);
      },
    );
  }

  /// Load next page (pagination)
  Future<void> loadMore() async {
    if (state.isLoading) {
      return;
    }

    _currentPage++;

    final result = await _fetchByCategory(_currentPage);

    result.fold(
      (failure) {
        _currentPage--;
      },
      (movies) {
        _allMovies = [..._allMovies, ...movies];
        state = AsyncValue.data(_allMovies);
      },
    );
  }
}
