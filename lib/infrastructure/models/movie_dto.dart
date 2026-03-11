import 'package:agente_cine/infrastructure/models/genre_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie_dto.freezed.dart';
part 'movie_dto.g.dart';

/// Movie Data Transfer Object
@freezed
class MovieDto with _$MovieDto {
  const factory MovieDto({
    required int id,
    required String title,
    required String overview,
    @JsonKey(name: 'poster_path') String? posterPath,
    @JsonKey(name: 'backdrop_path') String? backdropPath,
    @JsonKey(name: 'release_date') String? releaseDate,
    @JsonKey(name: 'vote_average') required double voteAverage,
    @JsonKey(name: 'vote_count') required int voteCount,
    @JsonKey(name: 'genre_ids') List<int>? genreIds,
    List<GenreDto>? genres,
    int? runtime,
    @Default(false) bool isFavorite,
  }) = _MovieDto;

  factory MovieDto.fromJson(Map<String, dynamic> json) =>
      _$MovieDtoFromJson(json);
}
