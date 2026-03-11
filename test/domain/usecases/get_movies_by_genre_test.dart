import 'package:agente_cine/domain/entities/movie.dart';
import 'package:agente_cine/domain/failures/failure.dart';
import 'package:agente_cine/domain/usecases/get_movies_by_genre.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../helpers/mock_factories.dart';

void main() {
  late GetMoviesByGenre usecase;
  late MockMovieRepository mockRepository;

  setUp(() {
    mockRepository = MockMovieRepository();
    usecase = GetMoviesByGenre(mockRepository);
  });

  const testGenreId = 18;
  const testMovie = Movie(
    id: 550,
    title: 'Drama Movie',
    overview: 'A dramatic movie',
    voteAverage: 8.5,
    voteCount: 1000,
    genreIds: [18],
  );

  group('GetMoviesByGenre', () {
    test('should return list of movies when repository call is successful',
        () async {
      // Arrange
      when(() => mockRepository.getMoviesByGenre(
            genreId: any(named: 'genreId'),
            page: any(named: 'page'),
          )).thenAnswer((_) async => const Right([testMovie]));

      // Act
      final result = await usecase(genreId: testGenreId);

      // Assert
      expect(result, const Right<Failure, List<Movie>>([testMovie]));
      verify(() => mockRepository.getMoviesByGenre(
            genreId: testGenreId,
          )).called(1);
      verifyNoMoreInteractions(mockRepository);
    });

    test('should return Failure when repository call fails', () async {
      // Arrange
      const failure = Failure.network();
      when(() => mockRepository.getMoviesByGenre(
            genreId: any(named: 'genreId'),
            page: any(named: 'page'),
          )).thenAnswer((_) async => const Left(failure));

      // Act
      final result = await usecase(genreId: testGenreId);

      // Assert
      expect(result, const Left<Failure, List<Movie>>(failure));
      verify(() => mockRepository.getMoviesByGenre(
            genreId: testGenreId,
          )).called(1);
    });

    test('should use default page value when not provided', () async {
      // Arrange
      when(() => mockRepository.getMoviesByGenre(
            genreId: any(named: 'genreId'),
            page: any(named: 'page'),
          )).thenAnswer((_) async => const Right([testMovie]));

      // Act
      await usecase(genreId: testGenreId);

      // Assert
      verify(() => mockRepository.getMoviesByGenre(
            genreId: testGenreId,
          )).called(1);
    });
  });
}
