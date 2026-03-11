import 'package:agente_cine/infrastructure/datasources/remote/tmdb_remote_datasource.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@module
abstract class TmdbRemoteDataSourceModule {
  @lazySingleton
  TmdbRemoteDataSource tmdbRemoteDataSource(Dio dio) =>
      TmdbRemoteDataSource(dio);
}
