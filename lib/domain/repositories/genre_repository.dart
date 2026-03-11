import 'package:dartz/dartz.dart';

import 'package:agente_cine/domain/entities/genre.dart';
import 'package:agente_cine/domain/failures/failure.dart';

/// Repository contract for genre operations
abstract class GenreRepository {
  /// Get all available movie genres
  Future<Either<Failure, List<Genre>>> getGenres();
}
