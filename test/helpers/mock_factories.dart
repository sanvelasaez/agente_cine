import 'dart:convert';
import 'dart:io';

import 'package:agente_cine/domain/repositories/favorite_repository.dart';
import 'package:agente_cine/domain/repositories/genre_repository.dart';
import 'package:agente_cine/domain/repositories/movie_repository.dart';
import 'package:agente_cine/infrastructure/datasources/local/drift_local_datasource.dart';
import 'package:agente_cine/infrastructure/datasources/remote/tmdb_remote_datasource.dart';
import 'package:mocktail/mocktail.dart';

/// Mock implementations for testing
class MockMovieRepository extends Mock implements MovieRepository {}

class MockFavoriteRepository extends Mock implements FavoriteRepository {}

class MockGenreRepository extends Mock implements GenreRepository {}

class MockTmdbRemoteDataSource extends Mock implements TmdbRemoteDataSource {}

class MockDriftLocalDataSource extends Mock implements DriftLocalDataSource {}

/// Helper to read fixture files
String readFixture(String name) {
  final file = File('test/helpers/fixtures/$name');
  return file.readAsStringSync();
}

/// Helper to decode JSON fixture
Map<String, dynamic> jsonFixture(String name) {
  return json.decode(readFixture(name)) as Map<String, dynamic>;
}

/// Helper to decode JSON list fixture
List<dynamic> jsonListFixture(String name) {
  return json.decode(readFixture(name)) as List<dynamic>;
}
