import 'package:agente_cine/domain/entities/movie.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Movie Entity', () {
    test('releaseYear should return year from releaseDate', () {
      // Arrange
      final movie = Movie(
        id: 1,
        title: 'Test Movie',
        overview: 'Test overview',
        voteAverage: 8,
        voteCount: 100,
        releaseDate: DateTime(1999, 10, 15),
      );

      // Act
      final result = movie.releaseYear;

      // Assert
      expect(result, '1999');
    });

    test('releaseYear should return N/A when releaseDate is null', () {
      // Arrange
      const movie = Movie(
        id: 1,
        title: 'Test Movie',
        overview: 'Test overview',
        voteAverage: 8,
        voteCount: 100,
      );

      // Act
      final result = movie.releaseYear;

      // Assert
      expect(result, 'N/A');
    });

    test('runtimeFormatted should return hours and minutes', () {
      // Arrange
      const movie = Movie(
        id: 1,
        title: 'Test Movie',
        overview: 'Test overview',
        voteAverage: 8,
        voteCount: 100,
        runtime: 139,
      );

      // Act
      final result = movie.runtimeFormatted;

      // Assert
      expect(result, '2h 19min');
    });

    test('runtimeFormatted should return only hours when minutes are 0', () {
      // Arrange
      const movie = Movie(
        id: 1,
        title: 'Test Movie',
        overview: 'Test overview',
        voteAverage: 8,
        voteCount: 100,
        runtime: 120,
      );

      // Act
      final result = movie.runtimeFormatted;

      // Assert
      expect(result, '2h');
    });

    test('runtimeFormatted should return only minutes when hours are 0', () {
      // Arrange
      const movie = Movie(
        id: 1,
        title: 'Test Movie',
        overview: 'Test overview',
        voteAverage: 8,
        voteCount: 100,
        runtime: 45,
      );

      // Act
      final result = movie.runtimeFormatted;

      // Assert
      expect(result, '45min');
    });

    test('runtimeFormatted should return N/A when runtime is null', () {
      // Arrange
      const movie = Movie(
        id: 1,
        title: 'Test Movie',
        overview: 'Test overview',
        voteAverage: 8,
        voteCount: 100,
      );

      // Act
      final result = movie.runtimeFormatted;

      // Assert
      expect(result, 'N/A');
    });

    test('runtimeFormatted should return N/A when runtime is 0', () {
      // Arrange
      const movie = Movie(
        id: 1,
        title: 'Test Movie',
        overview: 'Test overview',
        voteAverage: 8,
        voteCount: 100,
        runtime: 0,
      );

      // Act
      final result = movie.runtimeFormatted;

      // Assert
      expect(result, 'N/A');
    });

    test('ratingOutOfFive should convert vote average to 5-star scale', () {
      // Arrange
      const movie = Movie(
        id: 1,
        title: 'Test Movie',
        overview: 'Test overview',
        voteAverage: 8.5,
        voteCount: 100,
      );

      // Act
      final result = movie.ratingOutOfFive;

      // Assert
      expect(result, 4.25);
    });

    test('hasBeenReleased should return true for past dates', () {
      // Arrange
      final movie = Movie(
        id: 1,
        title: 'Test Movie',
        overview: 'Test overview',
        voteAverage: 8,
        voteCount: 100,
        releaseDate: DateTime(2000),
      );

      // Act
      final result = movie.hasBeenReleased;

      // Assert
      expect(result, true);
    });

    test('hasBeenReleased should return false for future dates', () {
      // Arrange
      final movie = Movie(
        id: 1,
        title: 'Test Movie',
        overview: 'Test overview',
        voteAverage: 8,
        voteCount: 100,
        releaseDate: DateTime.now().add(const Duration(days: 30)),
      );

      // Act
      final result = movie.hasBeenReleased;

      // Assert
      expect(result, false);
    });

    test('hasBeenReleased should return false when releaseDate is null', () {
      // Arrange
      const movie = Movie(
        id: 1,
        title: 'Test Movie',
        overview: 'Test overview',
        voteAverage: 8,
        voteCount: 100,
      );

      // Act
      final result = movie.hasBeenReleased;

      // Assert
      expect(result, false);
    });
  });
}
