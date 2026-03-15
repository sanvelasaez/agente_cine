import 'package:agente_cine/domain/entities/movie.dart';
import 'package:agente_cine/domain/errors/failure.dart';
import 'package:agente_cine/domain/actions/get_favorites.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../helpers/mock_factories.dart';

void main() {
  late GetFavorites usecase;
  late MockFavoriteRepository mockRepository;

  setUp(() {
    mockRepository = MockFavoriteRepository();
    usecase = GetFavorites(mockRepository);
  });

  const testMovie = Movie(
    id: 550,
    title: 'Favorite Movie',
    overview: 'A favorite movie',
    voteAverage: 9,
    voteCount: 5000,
    isFavorite: true,
  );

  group('GetFavorites', () {
    test('should return list of favorite movies when successful', () async {
      // Arrange
      when(() => mockRepository.getFavorites())
          .thenAnswer((_) async => const Right([testMovie]));

      // Act
      final result = await usecase();

      // Assert
      expect(result, const Right<Failure, List<Movie>>([testMovie]));
      verify(() => mockRepository.getFavorites()).called(1);
      verifyNoMoreInteractions(mockRepository);
    });

    test('should return empty list when no favorites', () async {
      // Arrange
      when(() => mockRepository.getFavorites())
          .thenAnswer((_) async => const Right([]));

      // Act
      final result = await usecase();

      // Assert
      expect(result.isRight(), true);
      result.fold(
        (_) => fail('Should return Right'),
        (movies) => expect(movies.isEmpty, true),
      );
      verify(() => mockRepository.getFavorites()).called(1);
    });

    test('should return Failure when repository call fails', () async {
      // Arrange
      const failure = Failure.cache('Failed to load favorites');
      when(() => mockRepository.getFavorites())
          .thenAnswer((_) async => const Left(failure));

      // Act
      final result = await usecase();

      // Assert
      expect(result, const Left<Failure, List<Movie>>(failure));
      verify(() => mockRepository.getFavorites()).called(1);
    });
  });
}
