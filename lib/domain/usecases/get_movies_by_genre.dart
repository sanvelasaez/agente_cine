import 'package:dartz/dartz.dart';

import 'package:agente_cine/domain/entities/movie.dart';
import 'package:agente_cine/domain/failures/failure.dart';
import 'package:agente_cine/domain/repositories/movie_repository.dart';

/// Use case for getting movies by genre
class GetMoviesByGenre {
  const GetMoviesByGenre(this._repository);

  final MovieRepository _repository;

  Future<Either<Failure, List<Movie>>> call({
    required int genreId,
    int page = 1,
  }) {
    return _repository.getMoviesByGenre(genreId: genreId, page: page);
  }
}
