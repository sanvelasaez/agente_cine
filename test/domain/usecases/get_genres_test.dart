import 'package:agente_cine/domain/entities/genre.dart';
import 'package:agente_cine/domain/failures/failure.dart';
import 'package:agente_cine/domain/usecases/get_genres.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../helpers/mock_factories.dart';

void main() {
  late GetGenres usecase;
  late MockGenreRepository mockRepository;

  setUp(() {
    mockRepository = MockGenreRepository();
    usecase = GetGenres(mockRepository);
  });

  const testGenres = [
    Genre(id: 28, name: 'Action'),
    Genre(id: 18, name: 'Drama'),
    Genre(id: 35, name: 'Comedy'),
  ];

  group('GetGenres', () {
    test('should return list of genres when repository call is successful',
        () async {
      // Arrange
      when(() => mockRepository.getGenres())
          .thenAnswer((_) async => const Right(testGenres));

      // Act
      final result = await usecase();

      // Assert
      expect(result, const Right<Failure, List<Genre>>(testGenres));
      verify(() => mockRepository.getGenres()).called(1);
      verifyNoMoreInteractions(mockRepository);
    });

    test('should return empty list when no genres available', () async {
      // Arrange
      when(() => mockRepository.getGenres())
          .thenAnswer((_) async => const Right([]));

      // Act
      final result = await usecase();

      // Assert
      expect(result.isRight(), true);
      result.fold(
        (_) => fail('Should return Right'),
        (genres) => expect(genres.isEmpty, true),
      );
      verify(() => mockRepository.getGenres()).called(1);
    });

    test('should return Failure when repository call fails', () async {
      // Arrange
      const failure = Failure.network('Failed to load genres');
      when(() => mockRepository.getGenres())
          .thenAnswer((_) async => const Left(failure));

      // Act
      final result = await usecase();

      // Assert
      expect(result, const Left<Failure, List<Genre>>(failure));
      verify(() => mockRepository.getGenres()).called(1);
    });
  });
}
