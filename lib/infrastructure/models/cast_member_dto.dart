import 'package:freezed_annotation/freezed_annotation.dart';

part 'cast_member_dto.freezed.dart';
part 'cast_member_dto.g.dart';

/// Cast Member Data Transfer Object
@freezed
abstract class CastMemberDto with _$CastMemberDto {
  const factory CastMemberDto({
    required int id,
    required String name,
    required String character,
    @JsonKey(name: 'profile_path') String? profilePath,
    required int order,
  }) = _CastMemberDto;

  factory CastMemberDto.fromJson(Map<String, dynamic> json) =>
      _$CastMemberDtoFromJson(json);
}
