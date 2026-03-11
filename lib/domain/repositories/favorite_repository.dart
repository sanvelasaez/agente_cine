import 'package:dartz/dartz.dart';

import 'package:agente_cine/domain/entities/movie.dart';
import 'package:agente_cine/domain/failures/failure.dart';

/// Repository contract for favorite operations
abstract class FavoriteRepository {
  /// Get all favorite movies
  Future<Either<Failure, List<Movie>>> getFavorites();

  /// Toggle favorite status of a movie
  /// Returns the updated favorite status
  Future<Either<Failure, bool>> toggleFavorite(Movie movie);

  /// Check if a movie is favorite
  Future<Either<Failure, bool>> isFavorite(int movieId);
}
