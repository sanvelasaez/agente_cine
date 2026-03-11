// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cast_member_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CastMemberDtoImpl _$$CastMemberDtoImplFromJson(Map<String, dynamic> json) =>
    _$CastMemberDtoImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      character: json['character'] as String,
      profilePath: json['profile_path'] as String?,
      order: (json['order'] as num).toInt(),
    );

Map<String, dynamic> _$$CastMemberDtoImplToJson(_$CastMemberDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'character': instance.character,
      'profile_path': instance.profilePath,
      'order': instance.order,
    };
