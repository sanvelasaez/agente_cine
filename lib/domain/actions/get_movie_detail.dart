import 'package:agente_cine/domain/entities/movie.dart';
import 'package:agente_cine/domain/errors/failure.dart';
import 'package:agente_cine/domain/repositories/movie_repository.dart';
import 'package:dartz/dartz.dart';

/// Use case for getting movie detail
class GetMovieDetail {
  const GetMovieDetail(this._repository);

  final MovieRepository _repository;

  Future<Either<Failure, Movie>> call(int movieId) {
    return _repository.getMovieDetail(movieId);
  }
}
