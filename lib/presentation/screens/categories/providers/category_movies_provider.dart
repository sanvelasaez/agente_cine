import 'package:agente_cine/config/dependencies/injection.dart';
import 'package:agente_cine/domain/actions/get_movies_by_genre.dart';
import 'package:agente_cine/domain/entities/movie.dart';
import 'package:agente_cine/domain/errors/failure.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Provider for movies filtered by genre
final categoryMoviesProvider =
    StateNotifierProvider.family<
      CategoryMoviesNotifier,
      AsyncValue<List<Movie>>,
      int
    >((ref, genreId) {
      return CategoryMoviesNotifier(
        genreId: genreId,
        getMoviesByGenre: getIt<GetMoviesByGenre>(),
      )..loadMovies();
    });

/// Notifier for managing category movies state
class CategoryMoviesNotifier extends StateNotifier<AsyncValue<List<Movie>>> {
  CategoryMoviesNotifier({
    required this.genreId,
    required GetMoviesByGenre getMoviesByGenre,
  }) : _getMoviesByGenre = getMoviesByGenre,
       super(const AsyncValue.loading());

  final int genreId;
  final GetMoviesByGenre _getMoviesByGenre;
  int _currentPage = 1;
  List<Movie> _allMovies = [];

  /// Load movies for the genre
  Future<void> loadMovies() async {
    state = const AsyncValue.loading();
    _currentPage = 1;
    _allMovies = [];

    final result = await _getMoviesByGenre(
      genreId: genreId,
      page: _currentPage,
    );

    result.fold(
      (failure) =>
          state = AsyncValue.error(failure.userMessage, StackTrace.current),
      (movies) {
        _allMovies = movies;
        state = AsyncValue.data(_allMovies);
      },
    );
  }

  /// Load more movies (pagination)
  Future<void> loadMore() async {
    if (state.isLoading) {
      return;
    }

    _currentPage++;

    final result = await _getMoviesByGenre(
      genreId: genreId,
      page: _currentPage,
    );

    result.fold(
      (failure) {
        // Keep current state on error
        _currentPage--;
      },
      (movies) {
        _allMovies = [..._allMovies, ...movies];
        state = AsyncValue.data(_allMovies);
      },
    );
  }
}
