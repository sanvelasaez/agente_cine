import 'package:agente_cine/infrastructure/mappers/genre_mapper.dart';
import 'package:agente_cine/infrastructure/models/genre_dto.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('GenreMapper', () {
    test('should convert GenreDto to Genre entity', () {
      // Arrange
      const genreDto = GenreDto(id: 28, name: 'Action');

      // Act
      final genre = genreDto.toEntity();

      // Assert
      expect(genre.id, 28);
      expect(genre.name, 'Action');
    });

    test('should convert multiple GenreDtos', () {
      // Arrange
      const genres = [
        GenreDto(id: 28, name: 'Action'),
        GenreDto(id: 18, name: 'Drama'),
        GenreDto(id: 35, name: 'Comedy'),
      ];

      // Act
      final entities = genres.map((dto) => dto.toEntity()).toList();

      // Assert
      expect(entities.length, 3);
      expect(entities[0].id, 28);
      expect(entities[0].name, 'Action');
      expect(entities[1].id, 18);
      expect(entities[1].name, 'Drama');
      expect(entities[2].id, 35);
      expect(entities[2].name, 'Comedy');
    });
  });
}
