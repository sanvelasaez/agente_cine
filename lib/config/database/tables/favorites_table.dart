import 'package:drift/drift.dart';

/// Favorites table definition
class FavoritesTable extends Table {
  @override
  String get tableName => 'favorites';

  IntColumn get id => integer().autoIncrement()();

  IntColumn get movieId => integer().unique()();

  TextColumn get title => text()();

  TextColumn get posterPath => text().nullable()();

  RealColumn get voteAverage => real()();

  DateTimeColumn get addedAt => dateTime().withDefault(currentDateAndTime)();
}
