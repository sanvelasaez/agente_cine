// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_list_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MovieListResponseDto _$MovieListResponseDtoFromJson(
  Map<String, dynamic> json,
) => _MovieListResponseDto(
  page: (json['page'] as num).toInt(),
  results: (json['results'] as List<dynamic>)
      .map((e) => MovieDto.fromJson(e as Map<String, dynamic>))
      .toList(),
  totalPages: (json['total_pages'] as num).toInt(),
  totalResults: (json['total_results'] as num).toInt(),
);

Map<String, dynamic> _$MovieListResponseDtoToJson(
  _MovieListResponseDto instance,
) => <String, dynamic>{
  'page': instance.page,
  'results': instance.results,
  'total_pages': instance.totalPages,
  'total_results': instance.totalResults,
};
