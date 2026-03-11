import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';

import 'package:agente_cine/config/database/daos/favorites_dao.dart';
import 'package:agente_cine/config/database/tables/favorites_table.dart';

part 'app_database.g.dart';

/// Main database class for AgenteCine
@DriftDatabase(
  tables: [FavoritesTable],
  daos: [FavoritesDao],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  static LazyDatabase _openConnection() {
    return LazyDatabase(() async {
      final dbFolder = await getApplicationDocumentsDirectory();
      final file = File(path.join(dbFolder.path, 'agente_cine.db'));
      return NativeDatabase(file);
    });
  }
}
