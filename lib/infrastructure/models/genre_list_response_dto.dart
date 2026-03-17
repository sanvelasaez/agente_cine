import 'package:agente_cine/infrastructure/models/genre_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'genre_list_response_dto.freezed.dart';
part 'genre_list_response_dto.g.dart';

/// Genre List Response Data Transfer Object
@freezed
abstract class GenreListResponseDto with _$GenreListResponseDto {
  const factory GenreListResponseDto({required List<GenreDto> genres}) =
      _GenreListResponseDto;

  factory GenreListResponseDto.fromJson(Map<String, dynamic> json) =>
      _$GenreListResponseDtoFromJson(json);
}
