// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'genre_list_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GenreListResponseDto _$GenreListResponseDtoFromJson(
  Map<String, dynamic> json,
) => _GenreListResponseDto(
  genres: (json['genres'] as List<dynamic>)
      .map((e) => GenreDto.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$GenreListResponseDtoToJson(
  _GenreListResponseDto instance,
) => <String, dynamic>{'genres': instance.genres};
