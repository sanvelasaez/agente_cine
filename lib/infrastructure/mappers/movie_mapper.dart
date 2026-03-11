import 'package:agente_cine/domain/entities/movie.dart';
import 'package:agente_cine/infrastructure/mappers/genre_mapper.dart';
import 'package:agente_cine/infrastructure/models/movie_dto.dart';

/// Extension to map MovieDto to Movie entity
extension MovieMapper on MovieDto {
  Movie toEntity() {
    return Movie(
      id: id,
      title: title,
      overview: overview,
      posterPath: posterPath,
      backdropPath: backdropPath,
      releaseDate: _parseDate(releaseDate),
      voteAverage: voteAverage,
      voteCount: voteCount,
      genreIds: genreIds,
      genres: genres?.map((g) => g.toEntity()).toList(),
      runtime: runtime,
      isFavorite: isFavorite,
    );
  }

  DateTime? _parseDate(String? dateString) {
    if (dateString == null || dateString.isEmpty) return null;

    try {
      return DateTime.parse(dateString);
    } catch (e) {
      return null;
    }
  }
}
