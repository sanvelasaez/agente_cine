import 'package:dartz/dartz.dart';

import 'package:agente_cine/domain/entities/genre.dart';
import 'package:agente_cine/domain/failures/failure.dart';
import 'package:agente_cine/domain/repositories/genre_repository.dart';

/// Use case for getting all movie genres
class GetGenres {
  const GetGenres(this._repository);

  final GenreRepository _repository;

  Future<Either<Failure, List<Genre>>> call() {
    return _repository.getGenres();
  }
}
