import 'package:agente_cine/domain/entities/genre.dart';
import 'package:agente_cine/infrastructure/models/genre_dto.dart';

/// Extension to map GenreDto to Genre entity
extension GenreMapper on GenreDto {
  Genre toEntity() {
    return Genre(id: id, name: name);
  }
}
