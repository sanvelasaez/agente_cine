import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import 'package:agente_cine/config/constants/api_constants.dart';
import 'package:agente_cine/infrastructure/models/credits_response_dto.dart';
import 'package:agente_cine/infrastructure/models/genre_list_response_dto.dart';
import 'package:agente_cine/infrastructure/models/movie_dto.dart';
import 'package:agente_cine/infrastructure/models/movie_list_response_dto.dart';

part 'tmdb_remote_datasource.g.dart';

/// TMDB API Remote Data Source
@RestApi()
abstract class TmdbRemoteDataSource {
  factory TmdbRemoteDataSource(Dio dio) = _TmdbRemoteDataSource;

  @GET(ApiConstants.trendingMovies)
  Future<MovieListResponseDto> getTrending(@Query('page') int page);

  @GET(ApiConstants.popularMovies)
  Future<MovieListResponseDto> getPopular(@Query('page') int page);

  @GET(ApiConstants.topRatedMovies)
  Future<MovieListResponseDto> getTopRated(@Query('page') int page);

  @GET(ApiConstants.upcomingMovies)
  Future<MovieListResponseDto> getUpcoming(@Query('page') int page);

  @GET(ApiConstants.nowPlayingMovies)
  Future<MovieListResponseDto> getNowPlaying(@Query('page') int page);

  @GET('${ApiConstants.movieDetail}/{id}')
  Future<MovieDto> getMovieDetail(@Path('id') int movieId);

  @GET(ApiConstants.searchMovies)
  Future<MovieListResponseDto> searchMovies(
    @Query('query') String query,
    @Query('page') int page,
  );

  @GET(ApiConstants.discoverMovies)
  Future<MovieListResponseDto> getMoviesByGenre(
    @Query('with_genres') int genreId,
    @Query('page') int page,
  );

  @GET(ApiConstants.genreList)
  Future<GenreListResponseDto> getGenres();

  @GET('/movie/{id}/credits')
  Future<CreditsResponseDto> getMovieCredits(@Path('id') int movieId);
}
