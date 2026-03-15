import 'package:freezed_annotation/freezed_annotation.dart';

part 'genre_dto.freezed.dart';
part 'genre_dto.g.dart';

/// Genre Data Transfer Object
@freezed
abstract class GenreDto with _$GenreDto {
  const factory GenreDto({
    required int id,
    required String name,
  }) = _GenreDto;

  factory GenreDto.fromJson(Map<String, dynamic> json) =>
      _$GenreDtoFromJson(json);
}
