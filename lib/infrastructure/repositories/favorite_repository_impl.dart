import 'package:dartz/dartz.dart';

import 'package:agente_cine/domain/entities/movie.dart';
import 'package:agente_cine/domain/failures/failure.dart';
import 'package:agente_cine/domain/repositories/favorite_repository.dart';
import 'package:agente_cine/infrastructure/datasources/local/drift_local_datasource.dart';

/// Implementation of FavoriteRepository
class FavoriteRepositoryImpl implements FavoriteRepository {
  const FavoriteRepositoryImpl(this._localDataSource);

  final DriftLocalDataSource _localDataSource;

  @override
  Future<Either<Failure, List<Movie>>> getFavorites() async {
    try {
      final favorites = await _localDataSource.getFavorites();
      return Right(favorites);
    } catch (e) {
      return Left(Failure.cache(e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> toggleFavorite(Movie movie) async {
    try {
      final isFav = await _localDataSource.isFavorite(movie.id);

      if (isFav) {
        await _localDataSource.removeFavorite(movie.id);
        return const Right(false);
      } else {
        await _localDataSource.addFavorite(movie);
        return const Right(true);
      }
    } catch (e) {
      return Left(Failure.cache(e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> isFavorite(int movieId) async {
    try {
      final result = await _localDataSource.isFavorite(movieId);
      return Right(result);
    } catch (e) {
      return Left(Failure.cache(e.toString()));
    }
  }
}
