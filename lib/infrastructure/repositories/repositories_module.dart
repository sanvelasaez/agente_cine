import 'package:agente_cine/domain/repositories/favorite_repository.dart';
import 'package:agente_cine/domain/repositories/genre_repository.dart';
import 'package:agente_cine/domain/repositories/movie_repository.dart';
import 'package:agente_cine/infrastructure/datasources/local/drift_local_datasource.dart';
import 'package:agente_cine/infrastructure/datasources/remote/tmdb_remote_datasource.dart';
import 'package:agente_cine/infrastructure/repositories/favorite_repository_impl.dart';
import 'package:agente_cine/infrastructure/repositories/genre_repository_impl.dart';
import 'package:agente_cine/infrastructure/repositories/movie_repository_impl.dart';
import 'package:injectable/injectable.dart';

@module
abstract class RepositoriesModule {
  @LazySingleton(as: MovieRepository)
  MovieRepositoryImpl movieRepository(TmdbRemoteDataSource remoteDataSource) =>
      MovieRepositoryImpl(remoteDataSource);

  @LazySingleton(as: GenreRepository)
  GenreRepositoryImpl genreRepository(TmdbRemoteDataSource remoteDataSource) =>
      GenreRepositoryImpl(remoteDataSource);

  @LazySingleton(as: FavoriteRepository)
  FavoriteRepositoryImpl favoriteRepository(
    DriftLocalDataSource localDataSource,
  ) =>
      FavoriteRepositoryImpl(localDataSource);
}
