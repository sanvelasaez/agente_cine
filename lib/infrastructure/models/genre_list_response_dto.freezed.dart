// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'genre_list_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

GenreListResponseDto _$GenreListResponseDtoFromJson(Map<String, dynamic> json) {
  return _GenreListResponseDto.fromJson(json);
}

/// @nodoc
mixin _$GenreListResponseDto {
  List<GenreDto> get genres => throw _privateConstructorUsedError;

  /// Serializes this GenreListResponseDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GenreListResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GenreListResponseDtoCopyWith<GenreListResponseDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GenreListResponseDtoCopyWith<$Res> {
  factory $GenreListResponseDtoCopyWith(
    GenreListResponseDto value,
    $Res Function(GenreListResponseDto) then,
  ) = _$GenreListResponseDtoCopyWithImpl<$Res, GenreListResponseDto>;
  @useResult
  $Res call({List<GenreDto> genres});
}

/// @nodoc
class _$GenreListResponseDtoCopyWithImpl<
  $Res,
  $Val extends GenreListResponseDto
>
    implements $GenreListResponseDtoCopyWith<$Res> {
  _$GenreListResponseDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GenreListResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? genres = null}) {
    return _then(
      _value.copyWith(
            genres: null == genres
                ? _value.genres
                : genres // ignore: cast_nullable_to_non_nullable
                      as List<GenreDto>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$GenreListResponseDtoImplCopyWith<$Res>
    implements $GenreListResponseDtoCopyWith<$Res> {
  factory _$$GenreListResponseDtoImplCopyWith(
    _$GenreListResponseDtoImpl value,
    $Res Function(_$GenreListResponseDtoImpl) then,
  ) = __$$GenreListResponseDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<GenreDto> genres});
}

/// @nodoc
class __$$GenreListResponseDtoImplCopyWithImpl<$Res>
    extends _$GenreListResponseDtoCopyWithImpl<$Res, _$GenreListResponseDtoImpl>
    implements _$$GenreListResponseDtoImplCopyWith<$Res> {
  __$$GenreListResponseDtoImplCopyWithImpl(
    _$GenreListResponseDtoImpl _value,
    $Res Function(_$GenreListResponseDtoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of GenreListResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? genres = null}) {
    return _then(
      _$GenreListResponseDtoImpl(
        genres: null == genres
            ? _value._genres
            : genres // ignore: cast_nullable_to_non_nullable
                  as List<GenreDto>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$GenreListResponseDtoImpl implements _GenreListResponseDto {
  const _$GenreListResponseDtoImpl({required final List<GenreDto> genres})
    : _genres = genres;

  factory _$GenreListResponseDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$GenreListResponseDtoImplFromJson(json);

  final List<GenreDto> _genres;
  @override
  List<GenreDto> get genres {
    if (_genres is EqualUnmodifiableListView) return _genres;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_genres);
  }

  @override
  String toString() {
    return 'GenreListResponseDto(genres: $genres)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GenreListResponseDtoImpl &&
            const DeepCollectionEquality().equals(other._genres, _genres));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_genres));

  /// Create a copy of GenreListResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GenreListResponseDtoImplCopyWith<_$GenreListResponseDtoImpl>
  get copyWith =>
      __$$GenreListResponseDtoImplCopyWithImpl<_$GenreListResponseDtoImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$GenreListResponseDtoImplToJson(this);
  }
}

abstract class _GenreListResponseDto implements GenreListResponseDto {
  const factory _GenreListResponseDto({required final List<GenreDto> genres}) =
      _$GenreListResponseDtoImpl;

  factory _GenreListResponseDto.fromJson(Map<String, dynamic> json) =
      _$GenreListResponseDtoImpl.fromJson;

  @override
  List<GenreDto> get genres;

  /// Create a copy of GenreListResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GenreListResponseDtoImplCopyWith<_$GenreListResponseDtoImpl>
  get copyWith => throw _privateConstructorUsedError;
}
