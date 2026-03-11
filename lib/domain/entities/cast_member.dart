import 'package:freezed_annotation/freezed_annotation.dart';

part 'cast_member.freezed.dart';

/// Cast member entity - represents an actor/actress in a movie
@freezed
class CastMember with _$CastMember {
  const factory CastMember({
    required int id,
    required String name,
    required String character,
    String? profilePath,
    required int order,
  }) = _CastMember;
}
