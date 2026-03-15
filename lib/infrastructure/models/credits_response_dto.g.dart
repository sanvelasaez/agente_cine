// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'credits_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CreditsResponseDto _$CreditsResponseDtoFromJson(Map<String, dynamic> json) =>
    _CreditsResponseDto(
      id: (json['id'] as num).toInt(),
      cast: (json['cast'] as List<dynamic>)
          .map((e) => CastMemberDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CreditsResponseDtoToJson(_CreditsResponseDto instance) =>
    <String, dynamic>{'id': instance.id, 'cast': instance.cast};
