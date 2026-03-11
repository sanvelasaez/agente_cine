import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:agente_cine/core/error/app_exception.dart';
import 'package:agente_cine/domain/failures/failure.dart';
import 'package:agente_cine/infrastructure/models/genre_dto.dart';
import 'package:agente_cine/infrastructure/models/genre_list_response_dto.dart';
import 'package:agente_cine/infrastructure/repositories/genre_repository_impl.dart';

import '../../helpers/mock_factories.dart';

void main() {
  late GenreRepositoryImpl repository;
  late MockTmdbRemoteDataSource mockDataSource;

  setUp(() {
    mockDataSource = MockTmdbRemoteDataSource();
    repository = GenreRepositoryImpl(mockDataSource);
  });

  const testGenreListResponse = GenreListResponseDto(
    genres: [
      GenreDto(id: 28, name: 'Action'),
      GenreDto(id: 18, name: 'Drama'),
      GenreDto(id: 35, name: 'Comedy'),
    ],
  );

  group('GenreRepositoryImpl', () {
    group('getGenres', () {
      test('should return list of genres on successful fetch', () async {
        // Arrange
        when(() => mockDataSource.getGenres())
            .thenAnswer((_) async => testGenreListResponse);

        // Act
        final result = await repository.getGenres();

        // Assert
        expect(result.isRight(), true);
        result.fold(
          (_) => fail('Should return Right'),
          (genres) {
            expect(genres.length, 3);
            expect(genres[0].id, 28);
            expect(genres[0].name, 'Action');
            expect(genres[1].id, 18);
            expect(genres[1].name, 'Drama');
            expect(genres[2].id, 35);
            expect(genres[2].name, 'Comedy');
          },
        );
        verify(() => mockDataSource.getGenres()).called(1);
      });

      test('should return network failure on DioException connection error',
          () async {
        // Arrange
        when(() => mockDataSource.getGenres()).thenThrow(
          DioException(
            requestOptions: RequestOptions(),
            type: DioExceptionType.connectionError,
          ),
        );

        // Act
        final result = await repository.getGenres();

        // Assert
        expect(result.isLeft(), true);
        result.fold(
          (failure) => expect(failure, isA<NetworkFailure>()),
          (_) => fail('Should return Left'),
        );
      });

      test('should return timeout failure on DioException timeout', () async {
        // Arrange
        when(() => mockDataSource.getGenres()).thenThrow(
          DioException(
            requestOptions: RequestOptions(),
            type: DioExceptionType.sendTimeout,
          ),
        );

        // Act
        final result = await repository.getGenres();

        // Assert
        expect(result.isLeft(), true);
        result.fold(
          (failure) => expect(failure, isA<TimeoutFailure>()),
          (_) => fail('Should return Left'),
        );
      });

      test('should return server failure on ServerException', () async {
        // Arrange
        when(() => mockDataSource.getGenres())
            .thenThrow(const ServerException('Server error'));

        // Act
        final result = await repository.getGenres();

        // Assert
        expect(result.isLeft(), true);
        result.fold(
          (failure) => expect(failure, isA<ServerFailure>()),
          (_) => fail('Should return Left'),
        );
      });

      test('should return network failure on NetworkException', () async {
        // Arrange
        when(() => mockDataSource.getGenres())
            .thenThrow(const NetworkException('No internet'));

        // Act
        final result = await repository.getGenres();

        // Assert
        expect(result.isLeft(), true);
        result.fold(
          (failure) => expect(failure, isA<NetworkFailure>()),
          (_) => fail('Should return Left'),
        );
      });

      test('should return unknown failure on other exceptions', () async {
        // Arrange
        when(() => mockDataSource.getGenres())
            .thenThrow(Exception('Unexpected error'));

        // Act
        final result = await repository.getGenres();

        // Assert
        expect(result.isLeft(), true);
        result.fold(
          (failure) => expect(failure, isA<UnknownFailure>()),
          (_) => fail('Should return Left'),
        );
      });
    });
  });
}
