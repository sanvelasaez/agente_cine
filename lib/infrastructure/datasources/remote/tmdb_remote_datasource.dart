import 'package:dio/dio.dart';

import 'package:agente_cine/config/constants/api_constants.dart';
import 'package:agente_cine/infrastructure/models/credits_response_dto.dart';
import 'package:agente_cine/infrastructure/models/genre_list_response_dto.dart';
import 'package:agente_cine/infrastructure/models/movie_dto.dart';
import 'package:agente_cine/infrastructure/models/movie_list_response_dto.dart';

/// TMDB API Remote Data Source (manual implementation with Dio)
class TmdbRemoteDataSource {
  const TmdbRemoteDataSource(this._dio);

  final Dio _dio;

  Future<MovieListResponseDto> getTrending(int page) async {
    final response = await _dio.get<Map<String, dynamic>>(
      ApiConstants.trendingMovies,
      queryParameters: {'page': page},
    );
    return MovieListResponseDto.fromJson(response.data!);
  }

  Future<MovieListResponseDto> getPopular(int page) async {
    final response = await _dio.get<Map<String, dynamic>>(
      ApiConstants.popularMovies,
      queryParameters: {'page': page},
    );
    return MovieListResponseDto.fromJson(response.data!);
  }

  Future<MovieListResponseDto> getTopRated(int page) async {
    final response = await _dio.get<Map<String, dynamic>>(
      ApiConstants.topRatedMovies,
      queryParameters: {'page': page},
    );
    return MovieListResponseDto.fromJson(response.data!);
  }

  Future<MovieListResponseDto> getUpcoming(int page) async {
    final response = await _dio.get<Map<String, dynamic>>(
      ApiConstants.upcomingMovies,
      queryParameters: {'page': page},
    );
    return MovieListResponseDto.fromJson(response.data!);
  }

  Future<MovieListResponseDto> getNowPlaying(int page) async {
    final response = await _dio.get<Map<String, dynamic>>(
      ApiConstants.nowPlayingMovies,
      queryParameters: {'page': page},
    );
    return MovieListResponseDto.fromJson(response.data!);
  }

  Future<MovieDto> getMovieDetail(int movieId) async {
    final response = await _dio.get<Map<String, dynamic>>(
      '${ApiConstants.movieDetail}/$movieId',
    );
    return MovieDto.fromJson(response.data!);
  }

  Future<MovieListResponseDto> searchMovies(String query, int page) async {
    final response = await _dio.get<Map<String, dynamic>>(
      ApiConstants.searchMovies,
      queryParameters: {'query': query, 'page': page},
    );
    return MovieListResponseDto.fromJson(response.data!);
  }

  Future<MovieListResponseDto> getMoviesByGenre(int genreId, int page) async {
    final response = await _dio.get<Map<String, dynamic>>(
      ApiConstants.discoverMovies,
      queryParameters: {'with_genres': genreId, 'page': page},
    );
    return MovieListResponseDto.fromJson(response.data!);
  }

  Future<GenreListResponseDto> getGenres() async {
    final response = await _dio.get<Map<String, dynamic>>(
      ApiConstants.genreList,
    );
    return GenreListResponseDto.fromJson(response.data!);
  }

  Future<CreditsResponseDto> getMovieCredits(int movieId) async {
    final response = await _dio.get<Map<String, dynamic>>(
      '/movie/$movieId/credits',
    );
    return CreditsResponseDto.fromJson(response.data!);
  }
}
