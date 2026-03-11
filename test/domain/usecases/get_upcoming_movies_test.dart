import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:agente_cine/domain/entities/movie.dart';
import 'package:agente_cine/domain/failures/failure.dart';
import 'package:agente_cine/domain/usecases/get_upcoming_movies.dart';

import '../../helpers/mock_factories.dart';

void main() {
  late GetUpcomingMovies usecase;
  late MockMovieRepository mockRepository;

  setUp(() {
    mockRepository = MockMovieRepository();
    usecase = GetUpcomingMovies(mockRepository);
  });

  const testMovie = Movie(
    id: 1,
    title: 'Upcoming Movie',
    overview: 'Test overview',
    voteAverage: 7.5,
    voteCount: 50,
  );

  group('GetUpcomingMovies', () {
    test('should return list of movies when repository call is successful',
        () async {
      // Arrange
      when(() => mockRepository.getUpcoming(page: any(named: 'page')))
          .thenAnswer((_) async => const Right([testMovie]));

      // Act
      final result = await usecase(page: 1);

      // Assert
      expect(result, const Right([testMovie]));
      verify(() => mockRepository.getUpcoming(page: 1)).called(1);
      verifyNoMoreInteractions(mockRepository);
    });

    test('should return Failure when repository call fails', () async {
      // Arrange
      const failure = Failure.network();
      when(() => mockRepository.getUpcoming(page: any(named: 'page')))
          .thenAnswer((_) async => const Left(failure));

      // Act
      final result = await usecase(page: 1);

      // Assert
      expect(result, const Left(failure));
      verify(() => mockRepository.getUpcoming(page: 1)).called(1);
    });
  });
}
