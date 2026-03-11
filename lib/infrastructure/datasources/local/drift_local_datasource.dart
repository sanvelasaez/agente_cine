import 'package:drift/drift.dart';

import 'package:agente_cine/config/database/app_database.dart';
import 'package:agente_cine/domain/entities/movie.dart';

/// Local data source using Drift for favorites
class DriftLocalDataSource {
  const DriftLocalDataSource(this._database);

  final AppDatabase _database;

  /// Get all favorite movies
  Future<List<Movie>> getFavorites() async {
    final favorites = await _database.favoritesDao.getAllFavorites();
    return favorites.map(_mapToMovie).toList();
  }

  /// Add a movie to favorites
  Future<void> addFavorite(Movie movie) async {
    final companion = FavoritesTableCompanion(
      movieId: Value(movie.id),
      title: Value(movie.title),
      posterPath: Value(movie.posterPath),
      voteAverage: Value(movie.voteAverage),
    );

    await _database.favoritesDao.insertFavorite(companion);
  }

  /// Remove a movie from favorites
  Future<void> removeFavorite(int movieId) async {
    await _database.favoritesDao.deleteFavorite(movieId);
  }

  /// Check if a movie is favorite
  Future<bool> isFavorite(int movieId) async {
    return _database.favoritesDao.isFavorite(movieId);
  }

  /// Map Drift table data to Movie entity
  Movie _mapToMovie(FavoritesTableData data) {
    return Movie(
      id: data.movieId,
      title: data.title,
      overview: '',
      posterPath: data.posterPath,
      voteAverage: data.voteAverage,
      voteCount: 0,
      isFavorite: true,
    );
  }
}
