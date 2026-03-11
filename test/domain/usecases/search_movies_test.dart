import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:agente_cine/domain/entities/movie.dart';
import 'package:agente_cine/domain/failures/failure.dart';
import 'package:agente_cine/domain/usecases/search_movies.dart';

import '../../helpers/mock_factories.dart';

void main() {
  late SearchMovies usecase;
  late MockMovieRepository mockRepository;

  setUp(() {
    mockRepository = MockMovieRepository();
    usecase = SearchMovies(mockRepository);
  });

  const testQuery = 'Fight Club';
  const testMovie = Movie(
    id: 550,
    title: 'Fight Club',
    overview: 'A movie about...',
    voteAverage: 8.433,
    voteCount: 27000,
  );

  group('SearchMovies', () {
    test('should return list of movies when search is successful', () async {
      // Arrange
      when(() => mockRepository.searchMovies(
            query: any(named: 'query'),
            page: any(named: 'page'),
          )).thenAnswer((_) async => const Right([testMovie]));

      // Act
      final result = await usecase(query: testQuery, page: 1);

      // Assert
      expect(result, const Right([testMovie]));
      verify(() => mockRepository.searchMovies(query: testQuery, page: 1))
          .called(1);
      verifyNoMoreInteractions(mockRepository);
    });

    test('should return validation failure when query is empty', () async {
      // Act
      final result = await usecase(query: '', page: 1);

      // Assert
      expect(result.isLeft(), true);
      result.fold(
        (failure) => expect(failure, isA<ValidationFailure>()),
        (_) => fail('Should return failure'),
      );
      verifyNever(() => mockRepository.searchMovies(
            query: any(named: 'query'),
            page: any(named: 'page'),
          ));
    });

    test('should return validation failure when query is only whitespace',
        () async {
      // Act
      final result = await usecase(query: '   ', page: 1);

      // Assert
      expect(result.isLeft(), true);
      result.fold(
        (failure) => expect(failure, isA<ValidationFailure>()),
        (_) => fail('Should return failure'),
      );
      verifyNever(() => mockRepository.searchMovies(
            query: any(named: 'query'),
            page: any(named: 'page'),
          ));
    });

    test('should return Failure when repository call fails', () async {
      // Arrange
      const failure = Failure.network();
      when(() => mockRepository.searchMovies(
            query: any(named: 'query'),
            page: any(named: 'page'),
          )).thenAnswer((_) async => const Left(failure));

      // Act
      final result = await usecase(query: testQuery, page: 1);

      // Assert
      expect(result, const Left(failure));
      verify(() => mockRepository.searchMovies(query: testQuery, page: 1))
          .called(1);
    });

    test('should use default page value when not provided', () async {
      // Arrange
      when(() => mockRepository.searchMovies(
            query: any(named: 'query'),
            page: any(named: 'page'),
          )).thenAnswer((_) async => const Right([testMovie]));

      // Act
      await usecase(query: testQuery);

      // Assert
      verify(() => mockRepository.searchMovies(query: testQuery, page: 1))
          .called(1);
    });
  });
}
