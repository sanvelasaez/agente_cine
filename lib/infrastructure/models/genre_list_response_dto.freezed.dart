// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'genre_list_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GenreListResponseDto {

 List<GenreDto> get genres;
/// Create a copy of GenreListResponseDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GenreListResponseDtoCopyWith<GenreListResponseDto> get copyWith => _$GenreListResponseDtoCopyWithImpl<GenreListResponseDto>(this as GenreListResponseDto, _$identity);

  /// Serializes this GenreListResponseDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GenreListResponseDto&&const DeepCollectionEquality().equals(other.genres, genres));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(genres));

@override
String toString() {
  return 'GenreListResponseDto(genres: $genres)';
}


}

/// @nodoc
abstract mixin class $GenreListResponseDtoCopyWith<$Res>  {
  factory $GenreListResponseDtoCopyWith(GenreListResponseDto value, $Res Function(GenreListResponseDto) _then) = _$GenreListResponseDtoCopyWithImpl;
@useResult
$Res call({
 List<GenreDto> genres
});




}
/// @nodoc
class _$GenreListResponseDtoCopyWithImpl<$Res>
    implements $GenreListResponseDtoCopyWith<$Res> {
  _$GenreListResponseDtoCopyWithImpl(this._self, this._then);

  final GenreListResponseDto _self;
  final $Res Function(GenreListResponseDto) _then;

/// Create a copy of GenreListResponseDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? genres = null,}) {
  return _then(_self.copyWith(
genres: null == genres ? _self.genres : genres // ignore: cast_nullable_to_non_nullable
as List<GenreDto>,
  ));
}

}


/// Adds pattern-matching-related methods to [GenreListResponseDto].
extension GenreListResponseDtoPatterns on GenreListResponseDto {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GenreListResponseDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GenreListResponseDto() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GenreListResponseDto value)  $default,){
final _that = this;
switch (_that) {
case _GenreListResponseDto():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GenreListResponseDto value)?  $default,){
final _that = this;
switch (_that) {
case _GenreListResponseDto() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<GenreDto> genres)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GenreListResponseDto() when $default != null:
return $default(_that.genres);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<GenreDto> genres)  $default,) {final _that = this;
switch (_that) {
case _GenreListResponseDto():
return $default(_that.genres);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<GenreDto> genres)?  $default,) {final _that = this;
switch (_that) {
case _GenreListResponseDto() when $default != null:
return $default(_that.genres);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GenreListResponseDto implements GenreListResponseDto {
  const _GenreListResponseDto({required final  List<GenreDto> genres}): _genres = genres;
  factory _GenreListResponseDto.fromJson(Map<String, dynamic> json) => _$GenreListResponseDtoFromJson(json);

 final  List<GenreDto> _genres;
@override List<GenreDto> get genres {
  if (_genres is EqualUnmodifiableListView) return _genres;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_genres);
}


/// Create a copy of GenreListResponseDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GenreListResponseDtoCopyWith<_GenreListResponseDto> get copyWith => __$GenreListResponseDtoCopyWithImpl<_GenreListResponseDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GenreListResponseDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GenreListResponseDto&&const DeepCollectionEquality().equals(other._genres, _genres));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_genres));

@override
String toString() {
  return 'GenreListResponseDto(genres: $genres)';
}


}

/// @nodoc
abstract mixin class _$GenreListResponseDtoCopyWith<$Res> implements $GenreListResponseDtoCopyWith<$Res> {
  factory _$GenreListResponseDtoCopyWith(_GenreListResponseDto value, $Res Function(_GenreListResponseDto) _then) = __$GenreListResponseDtoCopyWithImpl;
@override @useResult
$Res call({
 List<GenreDto> genres
});




}
/// @nodoc
class __$GenreListResponseDtoCopyWithImpl<$Res>
    implements _$GenreListResponseDtoCopyWith<$Res> {
  __$GenreListResponseDtoCopyWithImpl(this._self, this._then);

  final _GenreListResponseDto _self;
  final $Res Function(_GenreListResponseDto) _then;

/// Create a copy of GenreListResponseDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? genres = null,}) {
  return _then(_GenreListResponseDto(
genres: null == genres ? _self._genres : genres // ignore: cast_nullable_to_non_nullable
as List<GenreDto>,
  ));
}


}

// dart format on
