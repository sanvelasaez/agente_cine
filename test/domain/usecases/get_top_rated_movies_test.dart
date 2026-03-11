import 'package:agente_cine/domain/entities/movie.dart';
import 'package:agente_cine/domain/failures/failure.dart';
import 'package:agente_cine/domain/usecases/get_top_rated_movies.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../helpers/mock_factories.dart';

void main() {
  late GetTopRatedMovies usecase;
  late MockMovieRepository mockRepository;

  setUp(() {
    mockRepository = MockMovieRepository();
    usecase = GetTopRatedMovies(mockRepository);
  });

  const testMovie = Movie(
    id: 1,
    title: 'Test Movie',
    overview: 'Test overview',
    voteAverage: 9,
    voteCount: 500,
  );

  group('GetTopRatedMovies', () {
    test('should return list of movies when repository call is successful',
        () async {
      // Arrange
      when(() => mockRepository.getTopRated(page: any(named: 'page')))
          .thenAnswer((_) async => const Right([testMovie]));

      // Act
      final result = await usecase();

      // Assert
      expect(result, const Right([testMovie]));
      verify(() => mockRepository.getTopRated()).called(1);
      verifyNoMoreInteractions(mockRepository);
    });

    test('should return Failure when repository call fails', () async {
      // Arrange
      const failure = Failure.timeout();
      when(() => mockRepository.getTopRated(page: any(named: 'page')))
          .thenAnswer((_) async => const Left(failure));

      // Act
      final result = await usecase();

      // Assert
      expect(result, const Left(failure));
      verify(() => mockRepository.getTopRated()).called(1);
    });

    test('should use default page value when not provided', () async {
      // Arrange
      when(() => mockRepository.getTopRated(page: any(named: 'page')))
          .thenAnswer((_) async => const Right([testMovie]));

      // Act
      await usecase();

      // Assert
      verify(() => mockRepository.getTopRated()).called(1);
    });
  });
}
