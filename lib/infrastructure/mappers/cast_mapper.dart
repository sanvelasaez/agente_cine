import 'package:agente_cine/domain/entities/cast_member.dart';
import 'package:agente_cine/infrastructure/models/cast_member_dto.dart';

/// Extension to map CastMemberDto to CastMember entity
extension CastMapper on CastMemberDto {
  CastMember toEntity() {
    return CastMember(
      id: id,
      name: name,
      character: character,
      profilePath: profilePath,
      order: order,
    );
  }
}
