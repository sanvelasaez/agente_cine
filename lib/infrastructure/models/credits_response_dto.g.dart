// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'credits_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CreditsResponseDtoImpl _$$CreditsResponseDtoImplFromJson(
  Map<String, dynamic> json,
) => _$CreditsResponseDtoImpl(
  id: (json['id'] as num).toInt(),
  cast: (json['cast'] as List<dynamic>)
      .map((e) => CastMemberDto.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$$CreditsResponseDtoImplToJson(
  _$CreditsResponseDtoImpl instance,
) => <String, dynamic>{'id': instance.id, 'cast': instance.cast};
