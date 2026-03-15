// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'credits_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CreditsResponseDto {

 int get id; List<CastMemberDto> get cast;
/// Create a copy of CreditsResponseDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreditsResponseDtoCopyWith<CreditsResponseDto> get copyWith => _$CreditsResponseDtoCopyWithImpl<CreditsResponseDto>(this as CreditsResponseDto, _$identity);

  /// Serializes this CreditsResponseDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreditsResponseDto&&(identical(other.id, id) || other.id == id)&&const DeepCollectionEquality().equals(other.cast, cast));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,const DeepCollectionEquality().hash(cast));

@override
String toString() {
  return 'CreditsResponseDto(id: $id, cast: $cast)';
}


}

/// @nodoc
abstract mixin class $CreditsResponseDtoCopyWith<$Res>  {
  factory $CreditsResponseDtoCopyWith(CreditsResponseDto value, $Res Function(CreditsResponseDto) _then) = _$CreditsResponseDtoCopyWithImpl;
@useResult
$Res call({
 int id, List<CastMemberDto> cast
});




}
/// @nodoc
class _$CreditsResponseDtoCopyWithImpl<$Res>
    implements $CreditsResponseDtoCopyWith<$Res> {
  _$CreditsResponseDtoCopyWithImpl(this._self, this._then);

  final CreditsResponseDto _self;
  final $Res Function(CreditsResponseDto) _then;

/// Create a copy of CreditsResponseDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? cast = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,cast: null == cast ? _self.cast : cast // ignore: cast_nullable_to_non_nullable
as List<CastMemberDto>,
  ));
}

}


/// Adds pattern-matching-related methods to [CreditsResponseDto].
extension CreditsResponseDtoPatterns on CreditsResponseDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreditsResponseDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreditsResponseDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreditsResponseDto value)  $default,){
final _that = this;
switch (_that) {
case _CreditsResponseDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreditsResponseDto value)?  $default,){
final _that = this;
switch (_that) {
case _CreditsResponseDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  List<CastMemberDto> cast)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreditsResponseDto() when $default != null:
return $default(_that.id,_that.cast);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  List<CastMemberDto> cast)  $default,) {final _that = this;
switch (_that) {
case _CreditsResponseDto():
return $default(_that.id,_that.cast);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  List<CastMemberDto> cast)?  $default,) {final _that = this;
switch (_that) {
case _CreditsResponseDto() when $default != null:
return $default(_that.id,_that.cast);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CreditsResponseDto implements CreditsResponseDto {
  const _CreditsResponseDto({required this.id, required final  List<CastMemberDto> cast}): _cast = cast;
  factory _CreditsResponseDto.fromJson(Map<String, dynamic> json) => _$CreditsResponseDtoFromJson(json);

@override final  int id;
 final  List<CastMemberDto> _cast;
@override List<CastMemberDto> get cast {
  if (_cast is EqualUnmodifiableListView) return _cast;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_cast);
}


/// Create a copy of CreditsResponseDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreditsResponseDtoCopyWith<_CreditsResponseDto> get copyWith => __$CreditsResponseDtoCopyWithImpl<_CreditsResponseDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CreditsResponseDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreditsResponseDto&&(identical(other.id, id) || other.id == id)&&const DeepCollectionEquality().equals(other._cast, _cast));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,const DeepCollectionEquality().hash(_cast));

@override
String toString() {
  return 'CreditsResponseDto(id: $id, cast: $cast)';
}


}

/// @nodoc
abstract mixin class _$CreditsResponseDtoCopyWith<$Res> implements $CreditsResponseDtoCopyWith<$Res> {
  factory _$CreditsResponseDtoCopyWith(_CreditsResponseDto value, $Res Function(_CreditsResponseDto) _then) = __$CreditsResponseDtoCopyWithImpl;
@override @useResult
$Res call({
 int id, List<CastMemberDto> cast
});




}
/// @nodoc
class __$CreditsResponseDtoCopyWithImpl<$Res>
    implements _$CreditsResponseDtoCopyWith<$Res> {
  __$CreditsResponseDtoCopyWithImpl(this._self, this._then);

  final _CreditsResponseDto _self;
  final $Res Function(_CreditsResponseDto) _then;

/// Create a copy of CreditsResponseDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? cast = null,}) {
  return _then(_CreditsResponseDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,cast: null == cast ? _self._cast : cast // ignore: cast_nullable_to_non_nullable
as List<CastMemberDto>,
  ));
}


}

// dart format on
