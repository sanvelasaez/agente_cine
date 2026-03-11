import 'package:agente_cine/domain/entities/cast_member.dart';
import 'package:agente_cine/domain/entities/genre.dart';
import 'package:agente_cine/domain/entities/movie.dart';
import 'package:agente_cine/domain/failures/failure.dart';
import 'package:agente_cine/domain/usecases/get_movie_detail.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../helpers/mock_factories.dart';

void main() {
  late GetMovieDetail usecase;
  late MockMovieRepository mockRepository;

  setUp(() {
    mockRepository = MockMovieRepository();
    usecase = GetMovieDetail(mockRepository);
  });

  const testMovieId = 550;
  const testMovie = Movie(
    id: testMovieId,
    title: 'Fight Club',
    overview: 'A movie about...',
    voteAverage: 8.433,
    voteCount: 27000,
    runtime: 139,
    genres: [
      Genre(id: 18, name: 'Drama'),
      Genre(id: 53, name: 'Thriller'),
    ],
    cast: [
      CastMember(
        id: 819,
        name: 'Edward Norton',
        character: 'The Narrator',
        order: 0,
      ),
    ],
  );

  group('GetMovieDetail', () {
    test('should return movie detail when repository call is successful',
        () async {
      // Arrange
      when(() => mockRepository.getMovieDetail(any()))
          .thenAnswer((_) async => const Right(testMovie));

      // Act
      final result = await usecase(testMovieId);

      // Assert
      expect(result, const Right(testMovie));
      verify(() => mockRepository.getMovieDetail(testMovieId)).called(1);
      verifyNoMoreInteractions(mockRepository);
    });

    test('should return Failure when repository call fails', () async {
      // Arrange
      const failure = Failure.notFound('Movie not found');
      when(() => mockRepository.getMovieDetail(any()))
          .thenAnswer((_) async => const Left(failure));

      // Act
      final result = await usecase(testMovieId);

      // Assert
      expect(result, const Left(failure));
      verify(() => mockRepository.getMovieDetail(testMovieId)).called(1);
    });

    test('should return network failure when no internet', () async {
      // Arrange
      const failure = Failure.network('No internet connection');
      when(() => mockRepository.getMovieDetail(any()))
          .thenAnswer((_) async => const Left(failure));

      // Act
      final result = await usecase(testMovieId);

      // Assert
      expect(result, const Left(failure));
    });
  });
}
