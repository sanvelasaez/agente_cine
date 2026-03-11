import 'package:agente_cine/domain/entities/movie.dart';
import 'package:agente_cine/domain/failures/failure.dart';
import 'package:agente_cine/domain/repositories/favorite_repository.dart';
import 'package:dartz/dartz.dart';

/// Use case for getting favorite movies
class GetFavorites {
  const GetFavorites(this._repository);

  final FavoriteRepository _repository;

  Future<Either<Failure, List<Movie>>> call() {
    return _repository.getFavorites();
  }
}
