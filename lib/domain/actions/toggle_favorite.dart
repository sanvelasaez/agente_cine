import 'package:agente_cine/domain/entities/movie.dart';
import 'package:agente_cine/domain/errors/failure.dart';
import 'package:agente_cine/domain/repositories/favorite_repository.dart';
import 'package:dartz/dartz.dart';

/// Use case for toggling favorite status of a movie
class ToggleFavorite {
  const ToggleFavorite(this._repository);

  final FavoriteRepository _repository;

  /// Toggle favorite status
  /// Returns true if movie is now favorite, false if removed from favorites
  Future<Either<Failure, bool>> call(Movie movie) {
    return _repository.toggleFavorite(movie);
  }
}
