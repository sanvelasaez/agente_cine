import 'package:agente_cine/domain/entities/movie.dart';
import 'package:agente_cine/domain/failures/failure.dart';
import 'package:agente_cine/domain/usecases/get_now_playing_movies.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../helpers/mock_factories.dart';

void main() {
  late GetNowPlayingMovies usecase;
  late MockMovieRepository mockRepository;

  setUp(() {
    mockRepository = MockMovieRepository();
    usecase = GetNowPlayingMovies(mockRepository);
  });

  const testMovie = Movie(
    id: 1,
    title: 'Now Playing Movie',
    overview: 'Test overview',
    voteAverage: 8,
    voteCount: 200,
  );

  group('GetNowPlayingMovies', () {
    test('should return list of movies when repository call is successful',
        () async {
      // Arrange
      when(() => mockRepository.getNowPlaying(page: any(named: 'page')))
          .thenAnswer((_) async => const Right([testMovie]));

      // Act
      final result = await usecase();

      // Assert
      expect(result, const Right([testMovie]));
      verify(() => mockRepository.getNowPlaying()).called(1);
      verifyNoMoreInteractions(mockRepository);
    });

    test('should return Failure when repository call fails', () async {
      // Arrange
      const failure = Failure.server();
      when(() => mockRepository.getNowPlaying(page: any(named: 'page')))
          .thenAnswer((_) async => const Left(failure));

      // Act
      final result = await usecase();

      // Assert
      expect(result, const Left(failure));
      verify(() => mockRepository.getNowPlaying()).called(1);
    });
  });
}
