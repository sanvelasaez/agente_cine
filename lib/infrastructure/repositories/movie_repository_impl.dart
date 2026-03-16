import 'package:agente_cine/core/error/app_exception.dart';
import 'package:agente_cine/domain/entities/movie.dart';
import 'package:agente_cine/domain/errors/failure.dart';
import 'package:agente_cine/domain/repositories/movie_repository.dart';
import 'package:agente_cine/infrastructure/datasources/remote/tmdb_remote_datasource.dart';
import 'package:agente_cine/infrastructure/mappers/cast_mapper.dart';
import 'package:agente_cine/infrastructure/mappers/movie_mapper.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

/// Implementation of MovieRepository
class MovieRepositoryImpl implements MovieRepository {
  const MovieRepositoryImpl(this._remoteDataSource);

  final TmdbRemoteDataSource _remoteDataSource;

  @override
  Future<Either<Failure, List<Movie>>> getTrending({int page = 1}) async {
    return _executeRequest(() async {
      final response = await _remoteDataSource.getTrending(page);
      return response.results.map((dto) => dto.toEntity()).toList();
    });
  }

  @override
  Future<Either<Failure, List<Movie>>> getPopular({int page = 1}) async {
    return _executeRequest(() async {
      final response = await _remoteDataSource.getPopular(page);
      return response.results.map((dto) => dto.toEntity()).toList();
    });
  }

  @override
  Future<Either<Failure, List<Movie>>> getTopRated({int page = 1}) async {
    return _executeRequest(() async {
      final response = await _remoteDataSource.getTopRated(page);
      return response.results.map((dto) => dto.toEntity()).toList();
    });
  }

  @override
  Future<Either<Failure, List<Movie>>> getUpcoming({int page = 1}) async {
    return _executeRequest(() async {
      final response = await _remoteDataSource.getUpcoming(page);
      return response.results.map((dto) => dto.toEntity()).toList();
    });
  }

  @override
  Future<Either<Failure, List<Movie>>> getNowPlaying({int page = 1}) async {
    return _executeRequest(() async {
      final response = await _remoteDataSource.getNowPlaying(page);
      return response.results.map((dto) => dto.toEntity()).toList();
    });
  }

  @override
  Future<Either<Failure, Movie>> getMovieDetail(int movieId) async {
    return _executeRequest(() async {
      final movieDto = await _remoteDataSource.getMovieDetail(movieId);
      final creditsDto = await _remoteDataSource.getMovieCredits(movieId);

      final movie = movieDto.toEntity();
      final cast = creditsDto.cast.map((c) => c.toEntity()).toList();

      return movie.copyWith(cast: cast);
    });
  }

  @override
  Future<Either<Failure, List<Movie>>> searchMovies({
    required String query,
    int page = 1,
  }) async {
    return _executeRequest(() async {
      final response = await _remoteDataSource.searchMovies(query, page);
      return response.results.map((dto) => dto.toEntity()).toList();
    });
  }

  @override
  Future<Either<Failure, List<Movie>>> getMoviesByGenre({
    required int genreId,
    int page = 1,
  }) async {
    return _executeRequest(() async {
      final response = await _remoteDataSource.getMoviesByGenre(genreId, page);
      return response.results.map((dto) => dto.toEntity()).toList();
    });
  }

  /// Execute request with error handling
  Future<Either<Failure, T>> _executeRequest<T>(
    Future<T> Function() request,
  ) async {
    try {
      final result = await request();
      return Right(result);
    } on DioException catch (e) {
      return Left(_handleDioError(e));
    } on ServerException catch (e) {
      return Left(Failure.server(e.message));
    } on NetworkException catch (e) {
      return Left(Failure.network(e.message));
    } on ParseException catch (e) {
      return Left(Failure.parse(e.message));
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
        final statusCode = error.response?.statusCode;
        if (statusCode == 404) {
          return const Failure.notFound();
        } else if (statusCode == 401 || statusCode == 403) {
          return const Failure.unauthorized();
        }
        return Failure.server('Server error: $statusCode');

      case DioExceptionType.connectionError:
        return const Failure.network();

      case DioExceptionType.cancel:
        return const Failure.unknown('Request was cancelled');

      default:
        return Failure.unknown(error.message ?? 'Unknown error');
    }
  }
}
