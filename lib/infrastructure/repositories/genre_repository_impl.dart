import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:agente_cine/core/error/app_exception.dart';
import 'package:agente_cine/domain/entities/genre.dart';
import 'package:agente_cine/domain/failures/failure.dart';
import 'package:agente_cine/domain/repositories/genre_repository.dart';
import 'package:agente_cine/infrastructure/datasources/remote/tmdb_remote_datasource.dart';
import 'package:agente_cine/infrastructure/mappers/genre_mapper.dart';

/// Implementation of GenreRepository
class GenreRepositoryImpl implements GenreRepository {
  const GenreRepositoryImpl(this._remoteDataSource);

  final TmdbRemoteDataSource _remoteDataSource;

  @override
  Future<Either<Failure, List<Genre>>> getGenres() async {
    try {
      final response = await _remoteDataSource.getGenres();
      final genres = response.genres.map((dto) => dto.toEntity()).toList();
      return Right(genres);
    } on DioException catch (e) {
      return Left(_handleDioError(e));
    } on ServerException catch (e) {
      return Left(Failure.server(e.message));
    } on NetworkException catch (e) {
      return Left(Failure.network(e.message));
    } catch (e) {
      return Left(Failure.unknown(e.toString()));
    }
  }

  Failure _handleDioError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return const Failure.timeout();

      case DioExceptionType.badResponse:
        return Failure.server('Server error: ${error.response?.statusCode}');

      case DioExceptionType.connectionError:
        return const Failure.network();

      default:
        return Failure.unknown(error.message ?? 'Unknown error');
    }
  }
}
