import 'package:agente_cine/infrastructure/mappers/movie_mapper.dart';
import 'package:agente_cine/infrastructure/models/genre_dto.dart';
import 'package:agente_cine/infrastructure/models/movie_dto.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('MovieMapper', () {
    test('should convert MovieDto to Movie entity with all fields', () {
      // Arrange
      const movieDto = MovieDto(
        id: 550,
        title: 'Fight Club',
        overview: 'A ticking-time-bomb insomniac',
        posterPath: '/pB8BM7pdSp6B6Ih7QZ4DrQ3PmJK.jpg',
        backdropPath: '/fCayJrkfRaCRCTh8GqN30f8oyQF.jpg',
        releaseDate: '1999-10-15',
        voteAverage: 8.433,
        voteCount: 27000,
        genreIds: [18, 53],
        genres: [
          GenreDto(id: 18, name: 'Drama'),
          GenreDto(id: 53, name: 'Thriller'),
        ],
        runtime: 139,
      );

      // Act
      final movie = movieDto.toEntity();

      // Assert
      expect(movie.id, 550);
      expect(movie.title, 'Fight Club');
      expect(movie.overview, 'A ticking-time-bomb insomniac');
      expect(movie.posterPath, '/pB8BM7pdSp6B6Ih7QZ4DrQ3PmJK.jpg');
      expect(movie.backdropPath, '/fCayJrkfRaCRCTh8GqN30f8oyQF.jpg');
      expect(movie.releaseDate, DateTime(1999, 10, 15));
      expect(movie.voteAverage, 8.433);
      expect(movie.voteCount, 27000);
      expect(movie.genreIds, [18, 53]);
      expect(movie.genres?.length, 2);
      expect(movie.genres?[0].id, 18);
      expect(movie.genres?[0].name, 'Drama');
      expect(movie.runtime, 139);
      expect(movie.isFavorite, false);
    });

    test('should handle null optional fields', () {
      // Arrange
      const movieDto = MovieDto(
        id: 550,
        title: 'Fight Club',
        overview: 'A ticking-time-bomb insomniac',
        voteAverage: 8.433,
        voteCount: 27000,
      );

      // Act
      final movie = movieDto.toEntity();

      // Assert
      expect(movie.id, 550);
      expect(movie.title, 'Fight Club');
      expect(movie.posterPath, null);
      expect(movie.backdropPath, null);
      expect(movie.releaseDate, null);
      expect(movie.genreIds, null);
      expect(movie.genres, null);
      expect(movie.runtime, null);
    });

    test('should return null for invalid date string', () {
      // Arrange
      const movieDto = MovieDto(
        id: 550,
        title: 'Fight Club',
        overview: 'Overview',
        releaseDate: 'invalid-date',
        voteAverage: 8.433,
        voteCount: 27000,
      );

      // Act
      final movie = movieDto.toEntity();

      // Assert
      expect(movie.releaseDate, null);
    });

    test('should return null for empty date string', () {
      // Arrange
      const movieDto = MovieDto(
        id: 550,
        title: 'Fight Club',
        overview: 'Overview',
        releaseDate: '',
        voteAverage: 8.433,
        voteCount: 27000,
      );

      // Act
      final movie = movieDto.toEntity();

      // Assert
      expect(movie.releaseDate, null);
    });

    test('should map genres correctly', () {
      // Arrange
      const movieDto = MovieDto(
        id: 550,
        title: 'Fight Club',
        overview: 'Overview',
        voteAverage: 8.433,
        voteCount: 27000,
        genres: [
          GenreDto(id: 18, name: 'Drama'),
          GenreDto(id: 53, name: 'Thriller'),
          GenreDto(id: 35, name: 'Comedy'),
        ],
      );

      // Act
      final movie = movieDto.toEntity();

      // Assert
      expect(movie.genres?.length, 3);
      expect(movie.genres?[0].name, 'Drama');
      expect(movie.genres?[1].name, 'Thriller');
      expect(movie.genres?[2].name, 'Comedy');
    });
  });
}
