// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'credits_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

CreditsResponseDto _$CreditsResponseDtoFromJson(Map<String, dynamic> json) {
  return _CreditsResponseDto.fromJson(json);
}

/// @nodoc
mixin _$CreditsResponseDto {
  int get id => throw _privateConstructorUsedError;
  List<CastMemberDto> get cast => throw _privateConstructorUsedError;

  /// Serializes this CreditsResponseDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CreditsResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CreditsResponseDtoCopyWith<CreditsResponseDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreditsResponseDtoCopyWith<$Res> {
  factory $CreditsResponseDtoCopyWith(
    CreditsResponseDto value,
    $Res Function(CreditsResponseDto) then,
  ) = _$CreditsResponseDtoCopyWithImpl<$Res, CreditsResponseDto>;
  @useResult
  $Res call({int id, List<CastMemberDto> cast});
}

/// @nodoc
class _$CreditsResponseDtoCopyWithImpl<$Res, $Val extends CreditsResponseDto>
    implements $CreditsResponseDtoCopyWith<$Res> {
  _$CreditsResponseDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CreditsResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? id = null, Object? cast = null}) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int,
            cast: null == cast
                ? _value.cast
                : cast // ignore: cast_nullable_to_non_nullable
                      as List<CastMemberDto>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CreditsResponseDtoImplCopyWith<$Res>
    implements $CreditsResponseDtoCopyWith<$Res> {
  factory _$$CreditsResponseDtoImplCopyWith(
    _$CreditsResponseDtoImpl value,
    $Res Function(_$CreditsResponseDtoImpl) then,
  ) = __$$CreditsResponseDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, List<CastMemberDto> cast});
}

/// @nodoc
class __$$CreditsResponseDtoImplCopyWithImpl<$Res>
    extends _$CreditsResponseDtoCopyWithImpl<$Res, _$CreditsResponseDtoImpl>
    implements _$$CreditsResponseDtoImplCopyWith<$Res> {
  __$$CreditsResponseDtoImplCopyWithImpl(
    _$CreditsResponseDtoImpl _value,
    $Res Function(_$CreditsResponseDtoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CreditsResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? id = null, Object? cast = null}) {
    return _then(
      _$CreditsResponseDtoImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        cast: null == cast
            ? _value._cast
            : cast // ignore: cast_nullable_to_non_nullable
                  as List<CastMemberDto>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CreditsResponseDtoImpl implements _CreditsResponseDto {
  const _$CreditsResponseDtoImpl({
    required this.id,
    required final List<CastMemberDto> cast,
  }) : _cast = cast;

  factory _$CreditsResponseDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreditsResponseDtoImplFromJson(json);

  @override
  final int id;
  final List<CastMemberDto> _cast;
  @override
  List<CastMemberDto> get cast {
    if (_cast is EqualUnmodifiableListView) return _cast;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_cast);
  }

  @override
  String toString() {
    return 'CreditsResponseDto(id: $id, cast: $cast)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreditsResponseDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality().equals(other._cast, _cast));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, const DeepCollectionEquality().hash(_cast));

  /// Create a copy of CreditsResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreditsResponseDtoImplCopyWith<_$CreditsResponseDtoImpl> get copyWith =>
      __$$CreditsResponseDtoImplCopyWithImpl<_$CreditsResponseDtoImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$CreditsResponseDtoImplToJson(this);
  }
}

abstract class _CreditsResponseDto implements CreditsResponseDto {
  const factory _CreditsResponseDto({
    required final int id,
    required final List<CastMemberDto> cast,
  }) = _$CreditsResponseDtoImpl;

  factory _CreditsResponseDto.fromJson(Map<String, dynamic> json) =
      _$CreditsResponseDtoImpl.fromJson;

  @override
  int get id;
  @override
  List<CastMemberDto> get cast;

  /// Create a copy of CreditsResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreditsResponseDtoImplCopyWith<_$CreditsResponseDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
