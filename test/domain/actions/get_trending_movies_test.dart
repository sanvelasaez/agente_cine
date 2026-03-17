import 'package:agente_cine/domain/actions/get_trending_movies.dart';
import 'package:agente_cine/domain/entities/movie.dart';
import 'package:agente_cine/domain/errors/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../helpers/mock_factories.dart';

void main() {
  late GetTrendingMovies usecase;
  late MockMovieRepository mockRepository;

  setUp(() {
    mockRepository = MockMovieRepository();
    usecase = GetTrendingMovies(mockRepository);
  });

  const testMovie = Movie(
    id: 1,
    title: 'Test Movie',
    overview: 'Test overview',
    voteAverage: 8.5,
    voteCount: 100,
  );

  group('GetTrendingMovies', () {
    test(
      'should return list of movies when repository call is successful',
      () async {
        // Arrange
        when(
          () => mockRepository.getTrending(page: any(named: 'page')),
        ).thenAnswer((_) async => const Right([testMovie]));

        // Act
        final result = await usecase();

        // Assert
        expect(result, const Right<Failure, List<Movie>>([testMovie]));
        verify(() => mockRepository.getTrending()).called(1);
        verifyNoMoreInteractions(mockRepository);
      },
    );

    test('should return Failure when repository call fails', () async {
      // Arrange
      const failure = Failure.network('No internet connection');
      when(
        () => mockRepository.getTrending(page: any(named: 'page')),
      ).thenAnswer((_) async => const Left(failure));

      // Act
      final result = await usecase();

      // Assert
      expect(result, const Left<Failure, List<Movie>>(failure));
      verify(() => mockRepository.getTrending()).called(1);
    });

    test('should use default page value when not provided', () async {
      // Arrange
      when(
        () => mockRepository.getTrending(page: any(named: 'page')),
      ).thenAnswer((_) async => const Right([testMovie]));

      // Act
      await usecase();

      // Assert
      verify(() => mockRepository.getTrending()).called(1);
    });
  });
}
