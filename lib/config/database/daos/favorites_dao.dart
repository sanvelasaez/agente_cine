import 'package:agente_cine/config/database/app_database.dart';
import 'package:agente_cine/config/database/tables/favorites_table.dart';
import 'package:drift/drift.dart';

part 'favorites_dao.g.dart';

/// Data Access Object for favorites operations
@DriftAccessor(tables: [FavoritesTable])
class FavoritesDao extends DatabaseAccessor<AppDatabase>
    with _$FavoritesDaoMixin {
  FavoritesDao(super.db);

  /// Get all favorite movies
  Future<List<FavoritesTableData>> getAllFavorites() {
    return (select(favoritesTable)
          ..orderBy([
            (t) => OrderingTerm(expression: t.addedAt, mode: OrderingMode.desc),
          ]))
        .get();
  }

  /// Insert a favorite movie
  Future<int> insertFavorite(FavoritesTableCompanion favorite) {
    return into(favoritesTable).insert(favorite);
  }

  /// Delete a favorite by movie ID
  Future<int> deleteFavorite(int movieId) {
    return (delete(favoritesTable)..where((t) => t.movieId.equals(movieId)))
        .go();
  }

  /// Check if a movie is favorite
  Future<bool> isFavorite(int movieId) async {
    final result = await (select(favoritesTable)
          ..where((t) => t.movieId.equals(movieId)))
        .getSingleOrNull();
    return result != null;
  }

  /// Get favorite by movie ID
  Future<FavoritesTableData?> getFavoriteByMovieId(int movieId) {
    return (select(favoritesTable)..where((t) => t.movieId.equals(movieId)))
        .getSingleOrNull();
  }
}
