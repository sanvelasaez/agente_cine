// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'genre_list_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GenreListResponseDtoImpl _$$GenreListResponseDtoImplFromJson(
  Map<String, dynamic> json,
) => _$GenreListResponseDtoImpl(
  genres: (json['genres'] as List<dynamic>)
      .map((e) => GenreDto.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$$GenreListResponseDtoImplToJson(
  _$GenreListResponseDtoImpl instance,
) => <String, dynamic>{'genres': instance.genres};
