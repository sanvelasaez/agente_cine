// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:agente_cine/config/database/app_database.dart' as _i52;
import 'package:agente_cine/config/di/modules/app_module.dart' as _i404;
import 'package:agente_cine/domain/repositories/favorite_repository.dart'
    as _i155;
import 'package:agente_cine/domain/repositories/genre_repository.dart' as _i473;
import 'package:agente_cine/domain/repositories/movie_repository.dart' as _i885;
import 'package:agente_cine/domain/usecases/get_favorites.dart' as _i807;
import 'package:agente_cine/domain/usecases/get_genres.dart' as _i430;
import 'package:agente_cine/domain/usecases/get_movie_detail.dart' as _i460;
import 'package:agente_cine/domain/usecases/get_movies_by_genre.dart' as _i999;
import 'package:agente_cine/domain/usecases/get_now_playing_movies.dart'
    as _i690;
import 'package:agente_cine/domain/usecases/get_popular_movies.dart' as _i257;
import 'package:agente_cine/domain/usecases/get_top_rated_movies.dart' as _i510;
import 'package:agente_cine/domain/usecases/get_trending_movies.dart' as _i329;
import 'package:agente_cine/domain/usecases/get_upcoming_movies.dart' as _i339;
import 'package:agente_cine/domain/usecases/search_movies.dart' as _i705;
import 'package:agente_cine/domain/usecases/toggle_favorite.dart' as _i958;
import 'package:agente_cine/domain/usecases/usecases_module.dart' as _i765;
import 'package:agente_cine/infrastructure/datasources/local/drift_local_datasource.dart'
    as _i896;
import 'package:agente_cine/infrastructure/datasources/local/drift_local_datasource_module.dart'
    as _i968;
import 'package:agente_cine/infrastructure/datasources/remote/tmdb_remote_datasource.dart'
    as _i939;
import 'package:agente_cine/infrastructure/datasources/remote/tmdb_remote_datasource_module.dart'
    as _i645;
import 'package:agente_cine/infrastructure/repositories/repositories_module.dart'
    as _i512;
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final appModule = _$AppModule();
    final tmdbRemoteDataSourceModule = _$TmdbRemoteDataSourceModule();
    final repositoriesModule = _$RepositoriesModule();
    final useCasesModule = _$UseCasesModule();
    final driftLocalDataSourceModule = _$DriftLocalDataSourceModule();
    gh.lazySingleton<_i361.Dio>(() => appModule.dio);
    gh.lazySingleton<_i52.AppDatabase>(() => appModule.database);
    gh.lazySingleton<_i939.TmdbRemoteDataSource>(
      () => tmdbRemoteDataSourceModule.tmdbRemoteDataSource(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i885.MovieRepository>(
      () =>
          repositoriesModule.movieRepository(gh<_i939.TmdbRemoteDataSource>()),
    );
    gh.lazySingleton<_i329.GetTrendingMovies>(
      () => useCasesModule.getTrendingMovies(gh<_i885.MovieRepository>()),
    );
    gh.lazySingleton<_i257.GetPopularMovies>(
      () => useCasesModule.getPopularMovies(gh<_i885.MovieRepository>()),
    );
    gh.lazySingleton<_i510.GetTopRatedMovies>(
      () => useCasesModule.getTopRatedMovies(gh<_i885.MovieRepository>()),
    );
    gh.lazySingleton<_i339.GetUpcomingMovies>(
      () => useCasesModule.getUpcomingMovies(gh<_i885.MovieRepository>()),
    );
    gh.lazySingleton<_i690.GetNowPlayingMovies>(
      () => useCasesModule.getNowPlayingMovies(gh<_i885.MovieRepository>()),
    );
    gh.lazySingleton<_i460.GetMovieDetail>(
      () => useCasesModule.getMovieDetail(gh<_i885.MovieRepository>()),
    );
    gh.lazySingleton<_i705.SearchMovies>(
      () => useCasesModule.searchMovies(gh<_i885.MovieRepository>()),
    );
    gh.lazySingleton<_i999.GetMoviesByGenre>(
      () => useCasesModule.getMoviesByGenre(gh<_i885.MovieRepository>()),
    );
    gh.lazySingleton<_i896.DriftLocalDataSource>(
      () => driftLocalDataSourceModule.driftLocalDataSource(
        gh<_i52.AppDatabase>(),
      ),
    );
    gh.lazySingleton<_i155.FavoriteRepository>(
      () => repositoriesModule.favoriteRepository(
        gh<_i896.DriftLocalDataSource>(),
      ),
    );
    gh.lazySingleton<_i473.GenreRepository>(
      () =>
          repositoriesModule.genreRepository(gh<_i939.TmdbRemoteDataSource>()),
    );
    gh.lazySingleton<_i430.GetGenres>(
      () => useCasesModule.getGenres(gh<_i473.GenreRepository>()),
    );
    gh.lazySingleton<_i807.GetFavorites>(
      () => useCasesModule.getFavorites(gh<_i155.FavoriteRepository>()),
    );
    gh.lazySingleton<_i958.ToggleFavorite>(
      () => useCasesModule.toggleFavorite(gh<_i155.FavoriteRepository>()),
    );
    return this;
  }
}

class _$AppModule extends _i404.AppModule {}

class _$TmdbRemoteDataSourceModule extends _i645.TmdbRemoteDataSourceModule {}

class _$RepositoriesModule extends _i512.RepositoriesModule {}

class _$UseCasesModule extends _i765.UseCasesModule {}

class _$DriftLocalDataSourceModule extends _i968.DriftLocalDataSourceModule {}
