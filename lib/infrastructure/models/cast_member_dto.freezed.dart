// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cast_member_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

CastMemberDto _$CastMemberDtoFromJson(Map<String, dynamic> json) {
  return _CastMemberDto.fromJson(json);
}

/// @nodoc
mixin _$CastMemberDto {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get character => throw _privateConstructorUsedError;
  @JsonKey(name: 'profile_path')
  String? get profilePath => throw _privateConstructorUsedError;
  int get order => throw _privateConstructorUsedError;

  /// Serializes this CastMemberDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CastMemberDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CastMemberDtoCopyWith<CastMemberDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CastMemberDtoCopyWith<$Res> {
  factory $CastMemberDtoCopyWith(
    CastMemberDto value,
    $Res Function(CastMemberDto) then,
  ) = _$CastMemberDtoCopyWithImpl<$Res, CastMemberDto>;
  @useResult
  $Res call({
    int id,
    String name,
    String character,
    @JsonKey(name: 'profile_path') String? profilePath,
    int order,
  });
}

/// @nodoc
class _$CastMemberDtoCopyWithImpl<$Res, $Val extends CastMemberDto>
    implements $CastMemberDtoCopyWith<$Res> {
  _$CastMemberDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CastMemberDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? character = null,
    Object? profilePath = freezed,
    Object? order = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            character: null == character
                ? _value.character
                : character // ignore: cast_nullable_to_non_nullable
                      as String,
            profilePath: freezed == profilePath
                ? _value.profilePath
                : profilePath // ignore: cast_nullable_to_non_nullable
                      as String?,
            order: null == order
                ? _value.order
                : order // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CastMemberDtoImplCopyWith<$Res>
    implements $CastMemberDtoCopyWith<$Res> {
  factory _$$CastMemberDtoImplCopyWith(
    _$CastMemberDtoImpl value,
    $Res Function(_$CastMemberDtoImpl) then,
  ) = __$$CastMemberDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    String name,
    String character,
    @JsonKey(name: 'profile_path') String? profilePath,
    int order,
  });
}

/// @nodoc
class __$$CastMemberDtoImplCopyWithImpl<$Res>
    extends _$CastMemberDtoCopyWithImpl<$Res, _$CastMemberDtoImpl>
    implements _$$CastMemberDtoImplCopyWith<$Res> {
  __$$CastMemberDtoImplCopyWithImpl(
    _$CastMemberDtoImpl _value,
    $Res Function(_$CastMemberDtoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CastMemberDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? character = null,
    Object? profilePath = freezed,
    Object? order = null,
  }) {
    return _then(
      _$CastMemberDtoImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        character: null == character
            ? _value.character
            : character // ignore: cast_nullable_to_non_nullable
                  as String,
        profilePath: freezed == profilePath
            ? _value.profilePath
            : profilePath // ignore: cast_nullable_to_non_nullable
                  as String?,
        order: null == order
            ? _value.order
            : order // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CastMemberDtoImpl implements _CastMemberDto {
  const _$CastMemberDtoImpl({
    required this.id,
    required this.name,
    required this.character,
    @JsonKey(name: 'profile_path') this.profilePath,
    required this.order,
  });

  factory _$CastMemberDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$CastMemberDtoImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String character;
  @override
  @JsonKey(name: 'profile_path')
  final String? profilePath;
  @override
  final int order;

  @override
  String toString() {
    return 'CastMemberDto(id: $id, name: $name, character: $character, profilePath: $profilePath, order: $order)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CastMemberDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.character, character) ||
                other.character == character) &&
            (identical(other.profilePath, profilePath) ||
                other.profilePath == profilePath) &&
            (identical(other.order, order) || other.order == order));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, character, profilePath, order);

  /// Create a copy of CastMemberDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CastMemberDtoImplCopyWith<_$CastMemberDtoImpl> get copyWith =>
      __$$CastMemberDtoImplCopyWithImpl<_$CastMemberDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CastMemberDtoImplToJson(this);
  }
}

abstract class _CastMemberDto implements CastMemberDto {
  const factory _CastMemberDto({
    required final int id,
    required final String name,
    required final String character,
    @JsonKey(name: 'profile_path') final String? profilePath,
    required final int order,
  }) = _$CastMemberDtoImpl;

  factory _CastMemberDto.fromJson(Map<String, dynamic> json) =
      _$CastMemberDtoImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String get character;
  @override
  @JsonKey(name: 'profile_path')
  String? get profilePath;
  @override
  int get order;

  /// Create a copy of CastMemberDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CastMemberDtoImplCopyWith<_$CastMemberDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
