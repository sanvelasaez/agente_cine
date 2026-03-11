/// API constants for TMDB API v3
class ApiConstants {
  ApiConstants._();

  /// TMDB API Key
  static const String apiKey = '12f09b2a1cc31bb460929d44c9387f69';

  /// Base URL for TMDB API
  static const String baseUrl = 'https://api.themoviedb.org/3';

  /// Base URL for TMDB images
  static const String imageBaseUrl = 'https://image.tmdb.org/t/p/';

  /// Default timeout for requests (in milliseconds)
  static const int defaultTimeout = 30000;

  /// API Endpoints
  static const String trendingMovies = '/trending/movie/day';
  static const String popularMovies = '/movie/popular';
  static const String topRatedMovies = '/movie/top_rated';
  static const String upcomingMovies = '/movie/upcoming';
  static const String nowPlayingMovies = '/movie/now_playing';
  static const String movieDetail = '/movie';
  static const String searchMovies = '/search/movie';
  static const String discoverMovies = '/discover/movie';
  static const String genreList = '/genre/movie/list';
  static const String movieCredits = '/movie/{id}/credits';

  /// Query parameters
  static const String apiKeyParam = 'api_key';
  static const String languageParam = 'language';
  static const String pageParam = 'page';
  static const String queryParam = 'query';
  static const String withGenresParam = 'with_genres';

  /// Default language
  static const String defaultLanguage = 'es-ES';
}
