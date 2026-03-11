import 'package:agente_cine/core/error/app_exception.dart';
import 'package:agente_cine/domain/failures/failure.dart';
import 'package:agente_cine/infrastructure/models/cast_member_dto.dart';
import 'package:agente_cine/infrastructure/models/credits_response_dto.dart';
import 'package:agente_cine/infrastructure/models/genre_dto.dart';
import 'package:agente_cine/infrastructure/models/movie_dto.dart';
import 'package:agente_cine/infrastructure/models/movie_list_response_dto.dart';
import 'package:agente_cine/infrastructure/repositories/movie_repository_impl.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../helpers/mock_factories.dart';

void main() {
  late MovieRepositoryImpl repository;
  late MockTmdbRemoteDataSource mockDataSource;

  setUp(() {
    mockDataSource = MockTmdbRemoteDataSource();
    repository = MovieRepositoryImpl(mockDataSource);
  });

  const testMovieDto = MovieDto(
    id: 550,
    title: 'Fight Club',
    overview: 'A ticking-time-bomb insomniac',
    voteAverage: 8.433,
    voteCount: 27000,
  );

  const testListResponse = MovieListResponseDto(
    page: 1,
    results: [testMovieDto],
    totalPages: 100,
    totalResults: 2000,
  );

  group('MovieRepositoryImpl', () {
    group('getTrending', () {
      test('should return list of movies on successful fetch', () async {
        // Arrange
        when(() => mockDataSource.getTrending(any()))
            .thenAnswer((_) async => testListResponse);

        // Act
        final result = await repository.getTrending();

        // Assert
        expect(result.isRight(), true);
        result.fold(
          (_) => fail('Should return Right'),
          (movies) {
            expect(movies.length, 1);
            expect(movies[0].id, 550);
            expect(movies[0].title, 'Fight Club');
          },
        );
        verify(() => mockDataSource.getTrending(1)).called(1);
      });

      test('should return network failure on DioException connection error',
          () async {
        // Arrange
        when(() => mockDataSource.getTrending(any())).thenThrow(
          DioException(
            requestOptions: RequestOptions(),
            type: DioExceptionType.connectionError,
          ),
        );

        // Act
        final result = await repository.getTrending();

        // Assert
        expect(result.isLeft(), true);
        result.fold(
          (failure) => expect(failure, isA<NetworkFailure>()),
          (_) => fail('Should return Left'),
        );
      });

      test('should return timeout failure on DioException timeout', () async {
        // Arrange
        when(() => mockDataSource.getTrending(any())).thenThrow(
          DioException(
            requestOptions: RequestOptions(),
            type: DioExceptionType.connectionTimeout,
          ),
        );

        // Act
        final result = await repository.getTrending();

        // Assert
        expect(result.isLeft(), true);
        result.fold(
          (failure) => expect(failure, isA<TimeoutFailure>()),
          (_) => fail('Should return Left'),
        );
      });

      test('should return server failure on ServerException', () async {
        // Arrange
        when(() => mockDataSource.getTrending(any()))
            .thenThrow(const ServerException('Server error'));

        // Act
        final result = await repository.getTrending();

        // Assert
        expect(result.isLeft(), true);
        result.fold(
          (failure) => expect(failure, isA<ServerFailure>()),
          (_) => fail('Should return Left'),
        );
      });
    });

    group('getMovieDetail', () {
      const detailDto = MovieDto(
        id: 550,
        title: 'Fight Club',
        overview: 'Overview',
        voteAverage: 8.433,
        voteCount: 27000,
        runtime: 139,
        genres: [
          GenreDto(id: 18, name: 'Drama'),
        ],
      );

      const creditsDto = CreditsResponseDto(
        id: 550,
        cast: [
          CastMemberDto(
            id: 819,
            name: 'Edward Norton',
            character: 'The Narrator',
            order: 0,
          ),
        ],
      );

      test('should return movie detail with cast on success', () async {
        // Arrange
        when(() => mockDataSource.getMovieDetail(any()))
            .thenAnswer((_) async => detailDto);
        when(() => mockDataSource.getMovieCredits(any()))
            .thenAnswer((_) async => creditsDto);

        // Act
        final result = await repository.getMovieDetail(550);

        // Assert
        expect(result.isRight(), true);
        result.fold(
          (_) => fail('Should return Right'),
          (movie) {
            expect(movie.id, 550);
            expect(movie.title, 'Fight Club');
            expect(movie.runtime, 139);
            expect(movie.genres?.length, 1);
            expect(movie.cast?.length, 1);
            expect(movie.cast?[0].name, 'Edward Norton');
          },
        );
        verify(() => mockDataSource.getMovieDetail(550)).called(1);
        verify(() => mockDataSource.getMovieCredits(550)).called(1);
      });

      test('should return not found failure on 404', () async {
        // Arrange
        when(() => mockDataSource.getMovieDetail(any())).thenThrow(
          DioException(
            requestOptions: RequestOptions(),
            type: DioExceptionType.badResponse,
            response: Response(
              requestOptions: RequestOptions(),
              statusCode: 404,
            ),
          ),
        );

        // Act
        final result = await repository.getMovieDetail(550);

        // Assert
        expect(result.isLeft(), true);
        result.fold(
          (failure) => expect(failure, isA<NotFoundFailure>()),
          (_) => fail('Should return Left'),
        );
      });
    });

    group('searchMovies', () {
      test('should return list of movies on successful search', () async {
        // Arrange
        when(() => mockDataSource.searchMovies(any(), any()))
            .thenAnswer((_) async => testListResponse);

        // Act
        final result = await repository.searchMovies(query: 'Fight');

        // Assert
        expect(result.isRight(), true);
        result.fold(
          (_) => fail('Should return Right'),
          (movies) {
            expect(movies.length, 1);
            expect(movies[0].title, 'Fight Club');
          },
        );
        verify(() => mockDataSource.searchMovies('Fight', 1)).called(1);
      });

      test('should return network failure on NetworkException', () async {
        // Arrange
        when(() => mockDataSource.searchMovies(any(), any()))
            .thenThrow(const NetworkException('No internet'));

        // Act
        final result = await repository.searchMovies(query: 'Fight');

        // Assert
        expect(result.isLeft(), true);
        result.fold(
          (failure) => expect(failure, isA<NetworkFailure>()),
          (_) => fail('Should return Left'),
        );
      });
    });
  });
}
