import 'package:agente_cine/domain/entities/movie.dart';
import 'package:agente_cine/domain/failures/failure.dart';
import 'package:dartz/dartz.dart';

/// Repository contract for movie operations
abstract class MovieRepository {
  /// Get trending movies
  Future<Either<Failure, List<Movie>>> getTrending({int page = 1});

  /// Get popular movies
  Future<Either<Failure, List<Movie>>> getPopular({int page = 1});

  /// Get top rated movies
  Future<Either<Failure, List<Movie>>> getTopRated({int page = 1});

  /// Get upcoming movies
  Future<Either<Failure, List<Movie>>> getUpcoming({int page = 1});

  /// Get now playing movies
  Future<Either<Failure, List<Movie>>> getNowPlaying({int page = 1});

  /// Get movie detail by id
  Future<Either<Failure, Movie>> getMovieDetail(int movieId);

  /// Search movies by query
  Future<Either<Failure, List<Movie>>> searchMovies({
    required String query,
    int page = 1,
  });

  /// Get movies by genre
  Future<Either<Failure, List<Movie>>> getMoviesByGenre({
    required int genreId,
    int page = 1,
  });
}
