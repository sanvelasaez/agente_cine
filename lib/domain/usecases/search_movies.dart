import 'package:dartz/dartz.dart';

import 'package:agente_cine/domain/entities/movie.dart';
import 'package:agente_cine/domain/failures/failure.dart';
import 'package:agente_cine/domain/repositories/movie_repository.dart';

/// Use case for searching movies
class SearchMovies {
  const SearchMovies(this._repository);

  final MovieRepository _repository;

  Future<Either<Failure, List<Movie>>> call({
    required String query,
    int page = 1,
  }) {
    if (query.trim().isEmpty) {
      return Future.value(
        const Left(Failure.validation('Search query cannot be empty')),
      );
    }

    return _repository.searchMovies(query: query, page: page);
  }
}
