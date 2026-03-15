import 'package:agente_cine/domain/repositories/favorite_repository.dart';
import 'package:agente_cine/domain/repositories/genre_repository.dart';
import 'package:agente_cine/domain/repositories/movie_repository.dart';
import 'package:agente_cine/domain/actions/get_favorites.dart';
import 'package:agente_cine/domain/actions/get_genres.dart';
import 'package:agente_cine/domain/actions/get_movie_detail.dart';
import 'package:agente_cine/domain/actions/get_movies_by_genre.dart';
import 'package:agente_cine/domain/actions/get_now_playing_movies.dart';
import 'package:agente_cine/domain/actions/get_popular_movies.dart';
import 'package:agente_cine/domain/actions/get_top_rated_movies.dart';
import 'package:agente_cine/domain/actions/get_trending_movies.dart';
import 'package:agente_cine/domain/actions/get_upcoming_movies.dart';
import 'package:agente_cine/domain/actions/search_movies.dart';
import 'package:agente_cine/domain/actions/toggle_favorite.dart';
import 'package:injectable/injectable.dart';

@module
abstract class ActionsModule {
  @lazySingleton
  GetTrendingMovies getTrendingMovies(MovieRepository repository) =>
      GetTrendingMovies(repository);

  @lazySingleton
  GetPopularMovies getPopularMovies(MovieRepository repository) =>
      GetPopularMovies(repository);

  @lazySingleton
  GetTopRatedMovies getTopRatedMovies(MovieRepository repository) =>
      GetTopRatedMovies(repository);

  @lazySingleton
  GetUpcomingMovies getUpcomingMovies(MovieRepository repository) =>
      GetUpcomingMovies(repository);

  @lazySingleton
  GetNowPlayingMovies getNowPlayingMovies(MovieRepository repository) =>
      GetNowPlayingMovies(repository);

  @lazySingleton
  GetMovieDetail getMovieDetail(MovieRepository repository) =>
      GetMovieDetail(repository);

  @lazySingleton
  SearchMovies searchMovies(MovieRepository repository) =>
      SearchMovies(repository);

  @lazySingleton
  GetMoviesByGenre getMoviesByGenre(MovieRepository repository) =>
      GetMoviesByGenre(repository);

  @lazySingleton
  GetGenres getGenres(GenreRepository repository) => GetGenres(repository);

  @lazySingleton
  GetFavorites getFavorites(FavoriteRepository repository) =>
      GetFavorites(repository);

  @lazySingleton
  ToggleFavorite toggleFavorite(FavoriteRepository repository) =>
      ToggleFavorite(repository);
}
