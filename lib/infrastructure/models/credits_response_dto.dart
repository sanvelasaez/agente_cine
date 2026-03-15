import 'package:agente_cine/infrastructure/models/cast_member_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'credits_response_dto.freezed.dart';
part 'credits_response_dto.g.dart';

/// Credits Response Data Transfer Object
@freezed
abstract class CreditsResponseDto with _$CreditsResponseDto {
  const factory CreditsResponseDto({
    required int id,
    required List<CastMemberDto> cast,
  }) = _CreditsResponseDto;

  factory CreditsResponseDto.fromJson(Map<String, dynamic> json) =>
      _$CreditsResponseDtoFromJson(json);
}
