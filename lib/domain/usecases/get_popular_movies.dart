import 'package:agente_cine/domain/entities/movie.dart';
import 'package:agente_cine/domain/failures/failure.dart';
import 'package:agente_cine/domain/repositories/movie_repository.dart';
import 'package:dartz/dartz.dart';

/// Use case for getting popular movies
class GetPopularMovies {
  const GetPopularMovies(this._repository);

  final MovieRepository _repository;

  Future<Either<Failure, List<Movie>>> call({int page = 1}) {
    return _repository.getPopular(page: page);
  }
}
