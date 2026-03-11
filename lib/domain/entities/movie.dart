import 'package:agente_cine/domain/entities/cast_member.dart';
import 'package:agente_cine/domain/entities/genre.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie.freezed.dart';

/// Movie entity - represents a movie with all its details
@freezed
class Movie with _$Movie {
  const factory Movie({
    required int id,
    required String title,
    required String overview,
    String? posterPath,
    String? backdropPath,
    DateTime? releaseDate,
    required double voteAverage,
    required int voteCount,
    List<int>? genreIds,
    List<Genre>? genres,
    int? runtime,
    List<CastMember>? cast,
    @Default(false) bool isFavorite,
  }) = _Movie;

  const Movie._();

  /// Get release year as string
  String get releaseYear {
    final date = releaseDate;
    if (date == null) return 'N/A';
    return date.year.toString();
  }

  /// Get runtime formatted as hours and minutes
  String get runtimeFormatted {
    final rt = runtime;
    if (rt == null || rt == 0) return 'N/A';

    final hours = rt ~/ 60;
    final minutes = rt % 60;

    if (hours == 0) return '${minutes}min';
    if (minutes == 0) return '${hours}h';

    return '${hours}h ${minutes}min';
  }

  /// Get rating out of 5 stars
  double get ratingOutOfFive {
    return voteAverage / 2;
  }

  /// Check if movie has been released
  bool get hasBeenReleased {
    final date = releaseDate;
    if (date == null) return false;
    return date.isBefore(DateTime.now());
  }
}
