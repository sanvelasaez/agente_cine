import 'package:agente_cine/domain/entities/movie.dart';
import 'package:agente_cine/domain/errors/failure.dart';
import 'package:agente_cine/domain/repositories/movie_repository.dart';
import 'package:dartz/dartz.dart';

/// Use case for getting trending movies
class GetTrendingMovies {
  const GetTrendingMovies(this._repository);

  final MovieRepository _repository;

  Future<Either<Failure, List<Movie>>> call({int page = 1}) {
    return _repository.getTrending(page: page);
  }
}
