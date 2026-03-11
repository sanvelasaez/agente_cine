import 'package:agente_cine/infrastructure/models/movie_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie_list_response_dto.freezed.dart';
part 'movie_list_response_dto.g.dart';

/// Movie List Response Data Transfer Object
@freezed
class MovieListResponseDto with _$MovieListResponseDto {
  const factory MovieListResponseDto({
    required int page,
    required List<MovieDto> results,
    @JsonKey(name: 'total_pages') required int totalPages,
    @JsonKey(name: 'total_results') required int totalResults,
  }) = _MovieListResponseDto;

  factory MovieListResponseDto.fromJson(Map<String, dynamic> json) =>
      _$MovieListResponseDtoFromJson(json);
}
