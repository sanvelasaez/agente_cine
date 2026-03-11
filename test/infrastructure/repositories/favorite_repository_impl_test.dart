import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:agente_cine/domain/entities/movie.dart';
import 'package:agente_cine/domain/failures/failure.dart';
import 'package:agente_cine/infrastructure/repositories/favorite_repository_impl.dart';

import '../../helpers/mock_factories.dart';

void main() {
  late FavoriteRepositoryImpl repository;
  late MockDriftLocalDataSource mockDataSource;

  setUp(() {
    mockDataSource = MockDriftLocalDataSource();
    repository = FavoriteRepositoryImpl(mockDataSource);
  });

  const testMovie = Movie(
    id: 550,
    title: 'Fight Club',
    overview: 'Overview',
    voteAverage: 8.433,
    voteCount: 27000,
    isFavorite: true,
  );

  setUpAll(() {
    registerFallbackValue(testMovie);
  });

  group('FavoriteRepositoryImpl', () {
    group('getFavorites', () {
      test('should return list of favorite movies on success', () async {
        // Arrange
        when(() => mockDataSource.getFavorites())
            .thenAnswer((_) async => [testMovie]);

        // Act
        final result = await repository.getFavorites();

        // Assert
        expect(result.isRight(), true);
        result.fold(
          (_) => fail('Should return Right'),
          (movies) {
            expect(movies.length, 1);
            expect(movies[0].id, 550);
            expect(movies[0].isFavorite, true);
          },
        );
        verify(() => mockDataSource.getFavorites()).called(1);
      });

      test('should return empty list when no favorites', () async {
        // Arrange
        when(() => mockDataSource.getFavorites())
            .thenAnswer((_) async => []);

        // Act
        final result = await repository.getFavorites();

        // Assert
        expect(result.isRight(), true);
        result.fold(
          (_) => fail('Should return Right'),
          (movies) => expect(movies.isEmpty, true),
        );
      });

      test('should return cache failure on exception', () async {
        // Arrange
        when(() => mockDataSource.getFavorites())
            .thenThrow(Exception('Database error'));

        // Act
        final result = await repository.getFavorites();

        // Assert
        expect(result.isLeft(), true);
        result.fold(
          (failure) => expect(failure, isA<CacheFailure>()),
          (_) => fail('Should return Left'),
        );
      });
    });

    group('toggleFavorite', () {
      test('should add movie to favorites and return true when not favorite',
          () async {
        // Arrange
        when(() => mockDataSource.isFavorite(any()))
            .thenAnswer((_) async => false);
        when(() => mockDataSource.addFavorite(any()))
            .thenAnswer((_) async => {});

        // Act
        final result = await repository.toggleFavorite(testMovie);

        // Assert
        expect(result, const Right(true));
        verify(() => mockDataSource.isFavorite(550)).called(1);
        verify(() => mockDataSource.addFavorite(testMovie)).called(1);
        verifyNever(() => mockDataSource.removeFavorite(any()));
      });

      test('should remove movie from favorites and return false when favorite',
          () async {
        // Arrange
        when(() => mockDataSource.isFavorite(any()))
            .thenAnswer((_) async => true);
        when(() => mockDataSource.removeFavorite(any()))
            .thenAnswer((_) async => {});

        // Act
        final result = await repository.toggleFavorite(testMovie);

        // Assert
        expect(result, const Right(false));
        verify(() => mockDataSource.isFavorite(550)).called(1);
        verify(() => mockDataSource.removeFavorite(550)).called(1);
        verifyNever(() => mockDataSource.addFavorite(any()));
      });

      test('should return cache failure on exception', () async {
        // Arrange
        when(() => mockDataSource.isFavorite(any()))
            .thenThrow(Exception('Database error'));

        // Act
        final result = await repository.toggleFavorite(testMovie);

        // Assert
        expect(result.isLeft(), true);
        result.fold(
          (failure) => expect(failure, isA<CacheFailure>()),
          (_) => fail('Should return Left'),
        );
      });
    });

    group('isFavorite', () {
      test('should return true when movie is favorite', () async {
        // Arrange
        when(() => mockDataSource.isFavorite(any()))
            .thenAnswer((_) async => true);

        // Act
        final result = await repository.isFavorite(550);

        // Assert
        expect(result, const Right(true));
        verify(() => mockDataSource.isFavorite(550)).called(1);
      });

      test('should return false when movie is not favorite', () async {
        // Arrange
        when(() => mockDataSource.isFavorite(any()))
            .thenAnswer((_) async => false);

        // Act
        final result = await repository.isFavorite(550);

        // Assert
        expect(result, const Right(false));
        verify(() => mockDataSource.isFavorite(550)).called(1);
      });

      test('should return cache failure on exception', () async {
        // Arrange
        when(() => mockDataSource.isFavorite(any()))
            .thenThrow(Exception('Database error'));

        // Act
        final result = await repository.isFavorite(550);

        // Assert
        expect(result.isLeft(), true);
        result.fold(
          (failure) => expect(failure, isA<CacheFailure>()),
          (_) => fail('Should return Left'),
        );
      });
    });
  });
}
