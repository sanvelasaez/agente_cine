import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:agente_cine/domain/entities/movie.dart';
import 'package:agente_cine/domain/failures/failure.dart';
import 'package:agente_cine/domain/usecases/toggle_favorite.dart';

import '../../helpers/mock_factories.dart';

void main() {
  late ToggleFavorite usecase;
  late MockFavoriteRepository mockRepository;

  setUp(() {
    mockRepository = MockFavoriteRepository();
    usecase = ToggleFavorite(mockRepository);
  });

  const testMovie = Movie(
    id: 550,
    title: 'Test Movie',
    overview: 'A test movie',
    voteAverage: 8.5,
    voteCount: 1000,
    isFavorite: false,
  );

  setUpAll(() {
    registerFallbackValue(testMovie);
  });

  group('ToggleFavorite', () {
    test('should return true when movie is added to favorites', () async {
      // Arrange
      when(() => mockRepository.toggleFavorite(any()))
          .thenAnswer((_) async => const Right(true));

      // Act
      final result = await usecase(testMovie);

      // Assert
      expect(result, const Right(true));
      verify(() => mockRepository.toggleFavorite(testMovie)).called(1);
      verifyNoMoreInteractions(mockRepository);
    });

    test('should return false when movie is removed from favorites', () async {
      // Arrange
      final favoriteMovie = testMovie.copyWith(isFavorite: true);
      when(() => mockRepository.toggleFavorite(any()))
          .thenAnswer((_) async => const Right(false));

      // Act
      final result = await usecase(favoriteMovie);

      // Assert
      expect(result, const Right(false));
      verify(() => mockRepository.toggleFavorite(favoriteMovie)).called(1);
    });

    test('should return Failure when repository call fails', () async {
      // Arrange
      const failure = Failure.cache('Failed to toggle favorite');
      when(() => mockRepository.toggleFavorite(any()))
          .thenAnswer((_) async => const Left(failure));

      // Act
      final result = await usecase(testMovie);

      // Assert
      expect(result, const Left(failure));
      verify(() => mockRepository.toggleFavorite(testMovie)).called(1);
    });
  });
}
