// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$HomeEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomeEvent()';
}


}

/// @nodoc
class $HomeEventCopyWith<$Res>  {
$HomeEventCopyWith(HomeEvent _, $Res Function(HomeEvent) __);
}


/// Adds pattern-matching-related methods to [HomeEvent].
extension HomeEventPatterns on HomeEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Started value)?  started,TResult Function( _Refresh value)?  refresh,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _Refresh() when refresh != null:
return refresh(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Started value)  started,required TResult Function( _Refresh value)  refresh,}){
final _that = this;
switch (_that) {
case _Started():
return started(_that);case _Refresh():
return refresh(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Started value)?  started,TResult? Function( _Refresh value)?  refresh,}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _Refresh() when refresh != null:
return refresh(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  started,TResult Function()?  refresh,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _Refresh() when refresh != null:
return refresh();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  started,required TResult Function()  refresh,}) {final _that = this;
switch (_that) {
case _Started():
return started();case _Refresh():
return refresh();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  started,TResult? Function()?  refresh,}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _Refresh() when refresh != null:
return refresh();case _:
  return null;

}
}

}

/// @nodoc


class _Started implements HomeEvent {
  const _Started();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Started);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomeEvent.started()';
}


}




/// @nodoc


class _Refresh implements HomeEvent {
  const _Refresh();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Refresh);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomeEvent.refresh()';
}


}




/// @nodoc
mixin _$HomeState {

 AsyncValue<List<Movie>> get trending; AsyncValue<List<Movie>> get popular; AsyncValue<List<Movie>> get topRated; AsyncValue<List<Movie>> get upcoming; AsyncValue<List<Movie>> get nowPlaying;
/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomeStateCopyWith<HomeState> get copyWith => _$HomeStateCopyWithImpl<HomeState>(this as HomeState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeState&&(identical(other.trending, trending) || other.trending == trending)&&(identical(other.popular, popular) || other.popular == popular)&&(identical(other.topRated, topRated) || other.topRated == topRated)&&(identical(other.upcoming, upcoming) || other.upcoming == upcoming)&&(identical(other.nowPlaying, nowPlaying) || other.nowPlaying == nowPlaying));
}


@override
int get hashCode => Object.hash(runtimeType,trending,popular,topRated,upcoming,nowPlaying);

@override
String toString() {
  return 'HomeState(trending: $trending, popular: $popular, topRated: $topRated, upcoming: $upcoming, nowPlaying: $nowPlaying)';
}


}

/// @nodoc
abstract mixin class $HomeStateCopyWith<$Res>  {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) _then) = _$HomeStateCopyWithImpl;
@useResult
$Res call({
 AsyncValue<List<Movie>> trending, AsyncValue<List<Movie>> popular, AsyncValue<List<Movie>> topRated, AsyncValue<List<Movie>> upcoming, AsyncValue<List<Movie>> nowPlaying
});


$AsyncValueCopyWith<List<Movie>, $Res> get trending;$AsyncValueCopyWith<List<Movie>, $Res> get popular;$AsyncValueCopyWith<List<Movie>, $Res> get topRated;$AsyncValueCopyWith<List<Movie>, $Res> get upcoming;$AsyncValueCopyWith<List<Movie>, $Res> get nowPlaying;

}
/// @nodoc
class _$HomeStateCopyWithImpl<$Res>
    implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._self, this._then);

  final HomeState _self;
  final $Res Function(HomeState) _then;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? trending = null,Object? popular = null,Object? topRated = null,Object? upcoming = null,Object? nowPlaying = null,}) {
  return _then(_self.copyWith(
trending: null == trending ? _self.trending : trending // ignore: cast_nullable_to_non_nullable
as AsyncValue<List<Movie>>,popular: null == popular ? _self.popular : popular // ignore: cast_nullable_to_non_nullable
as AsyncValue<List<Movie>>,topRated: null == topRated ? _self.topRated : topRated // ignore: cast_nullable_to_non_nullable
as AsyncValue<List<Movie>>,upcoming: null == upcoming ? _self.upcoming : upcoming // ignore: cast_nullable_to_non_nullable
as AsyncValue<List<Movie>>,nowPlaying: null == nowPlaying ? _self.nowPlaying : nowPlaying // ignore: cast_nullable_to_non_nullable
as AsyncValue<List<Movie>>,
  ));
}
/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AsyncValueCopyWith<List<Movie>, $Res> get trending {
  
  return $AsyncValueCopyWith<List<Movie>, $Res>(_self.trending, (value) {
    return _then(_self.copyWith(trending: value));
  });
}/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AsyncValueCopyWith<List<Movie>, $Res> get popular {
  
  return $AsyncValueCopyWith<List<Movie>, $Res>(_self.popular, (value) {
    return _then(_self.copyWith(popular: value));
  });
}/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AsyncValueCopyWith<List<Movie>, $Res> get topRated {
  
  return $AsyncValueCopyWith<List<Movie>, $Res>(_self.topRated, (value) {
    return _then(_self.copyWith(topRated: value));
  });
}/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AsyncValueCopyWith<List<Movie>, $Res> get upcoming {
  
  return $AsyncValueCopyWith<List<Movie>, $Res>(_self.upcoming, (value) {
    return _then(_self.copyWith(upcoming: value));
  });
}/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AsyncValueCopyWith<List<Movie>, $Res> get nowPlaying {
  
  return $AsyncValueCopyWith<List<Movie>, $Res>(_self.nowPlaying, (value) {
    return _then(_self.copyWith(nowPlaying: value));
  });
}
}


/// Adds pattern-matching-related methods to [HomeState].
extension HomeStatePatterns on HomeState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HomeState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HomeState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HomeState value)  $default,){
final _that = this;
switch (_that) {
case _HomeState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HomeState value)?  $default,){
final _that = this;
switch (_that) {
case _HomeState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( AsyncValue<List<Movie>> trending,  AsyncValue<List<Movie>> popular,  AsyncValue<List<Movie>> topRated,  AsyncValue<List<Movie>> upcoming,  AsyncValue<List<Movie>> nowPlaying)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HomeState() when $default != null:
return $default(_that.trending,_that.popular,_that.topRated,_that.upcoming,_that.nowPlaying);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( AsyncValue<List<Movie>> trending,  AsyncValue<List<Movie>> popular,  AsyncValue<List<Movie>> topRated,  AsyncValue<List<Movie>> upcoming,  AsyncValue<List<Movie>> nowPlaying)  $default,) {final _that = this;
switch (_that) {
case _HomeState():
return $default(_that.trending,_that.popular,_that.topRated,_that.upcoming,_that.nowPlaying);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( AsyncValue<List<Movie>> trending,  AsyncValue<List<Movie>> popular,  AsyncValue<List<Movie>> topRated,  AsyncValue<List<Movie>> upcoming,  AsyncValue<List<Movie>> nowPlaying)?  $default,) {final _that = this;
switch (_that) {
case _HomeState() when $default != null:
return $default(_that.trending,_that.popular,_that.topRated,_that.upcoming,_that.nowPlaying);case _:
  return null;

}
}

}

/// @nodoc


class _HomeState implements HomeState {
  const _HomeState({this.trending = const AsyncValue<List<Movie>>.loading(), this.popular = const AsyncValue<List<Movie>>.loading(), this.topRated = const AsyncValue<List<Movie>>.loading(), this.upcoming = const AsyncValue<List<Movie>>.loading(), this.nowPlaying = const AsyncValue<List<Movie>>.loading()});
  

@override@JsonKey() final  AsyncValue<List<Movie>> trending;
@override@JsonKey() final  AsyncValue<List<Movie>> popular;
@override@JsonKey() final  AsyncValue<List<Movie>> topRated;
@override@JsonKey() final  AsyncValue<List<Movie>> upcoming;
@override@JsonKey() final  AsyncValue<List<Movie>> nowPlaying;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HomeStateCopyWith<_HomeState> get copyWith => __$HomeStateCopyWithImpl<_HomeState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HomeState&&(identical(other.trending, trending) || other.trending == trending)&&(identical(other.popular, popular) || other.popular == popular)&&(identical(other.topRated, topRated) || other.topRated == topRated)&&(identical(other.upcoming, upcoming) || other.upcoming == upcoming)&&(identical(other.nowPlaying, nowPlaying) || other.nowPlaying == nowPlaying));
}


@override
int get hashCode => Object.hash(runtimeType,trending,popular,topRated,upcoming,nowPlaying);

@override
String toString() {
  return 'HomeState(trending: $trending, popular: $popular, topRated: $topRated, upcoming: $upcoming, nowPlaying: $nowPlaying)';
}


}

/// @nodoc
abstract mixin class _$HomeStateCopyWith<$Res> implements $HomeStateCopyWith<$Res> {
  factory _$HomeStateCopyWith(_HomeState value, $Res Function(_HomeState) _then) = __$HomeStateCopyWithImpl;
@override @useResult
$Res call({
 AsyncValue<List<Movie>> trending, AsyncValue<List<Movie>> popular, AsyncValue<List<Movie>> topRated, AsyncValue<List<Movie>> upcoming, AsyncValue<List<Movie>> nowPlaying
});


@override $AsyncValueCopyWith<List<Movie>, $Res> get trending;@override $AsyncValueCopyWith<List<Movie>, $Res> get popular;@override $AsyncValueCopyWith<List<Movie>, $Res> get topRated;@override $AsyncValueCopyWith<List<Movie>, $Res> get upcoming;@override $AsyncValueCopyWith<List<Movie>, $Res> get nowPlaying;

}
/// @nodoc
class __$HomeStateCopyWithImpl<$Res>
    implements _$HomeStateCopyWith<$Res> {
  __$HomeStateCopyWithImpl(this._self, this._then);

  final _HomeState _self;
  final $Res Function(_HomeState) _then;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? trending = null,Object? popular = null,Object? topRated = null,Object? upcoming = null,Object? nowPlaying = null,}) {
  return _then(_HomeState(
trending: null == trending ? _self.trending : trending // ignore: cast_nullable_to_non_nullable
as AsyncValue<List<Movie>>,popular: null == popular ? _self.popular : popular // ignore: cast_nullable_to_non_nullable
as AsyncValue<List<Movie>>,topRated: null == topRated ? _self.topRated : topRated // ignore: cast_nullable_to_non_nullable
as AsyncValue<List<Movie>>,upcoming: null == upcoming ? _self.upcoming : upcoming // ignore: cast_nullable_to_non_nullable
as AsyncValue<List<Movie>>,nowPlaying: null == nowPlaying ? _self.nowPlaying : nowPlaying // ignore: cast_nullable_to_non_nullable
as AsyncValue<List<Movie>>,
  ));
}

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AsyncValueCopyWith<List<Movie>, $Res> get trending {
  
  return $AsyncValueCopyWith<List<Movie>, $Res>(_self.trending, (value) {
    return _then(_self.copyWith(trending: value));
  });
}/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AsyncValueCopyWith<List<Movie>, $Res> get popular {
  
  return $AsyncValueCopyWith<List<Movie>, $Res>(_self.popular, (value) {
    return _then(_self.copyWith(popular: value));
  });
}/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AsyncValueCopyWith<List<Movie>, $Res> get topRated {
  
  return $AsyncValueCopyWith<List<Movie>, $Res>(_self.topRated, (value) {
    return _then(_self.copyWith(topRated: value));
  });
}/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AsyncValueCopyWith<List<Movie>, $Res> get upcoming {
  
  return $AsyncValueCopyWith<List<Movie>, $Res>(_self.upcoming, (value) {
    return _then(_self.copyWith(upcoming: value));
  });
}/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AsyncValueCopyWith<List<Movie>, $Res> get nowPlaying {
  
  return $AsyncValueCopyWith<List<Movie>, $Res>(_self.nowPlaying, (value) {
    return _then(_self.copyWith(nowPlaying: value));
  });
}
}

/// @nodoc
mixin _$AsyncValue<T> {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AsyncValue<T>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AsyncValue<$T>()';
}


}

/// @nodoc
class $AsyncValueCopyWith<T,$Res>  {
$AsyncValueCopyWith(AsyncValue<T> _, $Res Function(AsyncValue<T>) __);
}


/// Adds pattern-matching-related methods to [AsyncValue].
extension AsyncValuePatterns<T> on AsyncValue<T> {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( AsyncLoading<T> value)?  loading,TResult Function( AsyncData<T> value)?  data,TResult Function( AsyncError<T> value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case AsyncLoading() when loading != null:
return loading(_that);case AsyncData() when data != null:
return data(_that);case AsyncError() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( AsyncLoading<T> value)  loading,required TResult Function( AsyncData<T> value)  data,required TResult Function( AsyncError<T> value)  error,}){
final _that = this;
switch (_that) {
case AsyncLoading():
return loading(_that);case AsyncData():
return data(_that);case AsyncError():
return error(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( AsyncLoading<T> value)?  loading,TResult? Function( AsyncData<T> value)?  data,TResult? Function( AsyncError<T> value)?  error,}){
final _that = this;
switch (_that) {
case AsyncLoading() when loading != null:
return loading(_that);case AsyncData() when data != null:
return data(_that);case AsyncError() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loading,TResult Function( T value)?  data,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case AsyncLoading() when loading != null:
return loading();case AsyncData() when data != null:
return data(_that.value);case AsyncError() when error != null:
return error(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loading,required TResult Function( T value)  data,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case AsyncLoading():
return loading();case AsyncData():
return data(_that.value);case AsyncError():
return error(_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loading,TResult? Function( T value)?  data,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case AsyncLoading() when loading != null:
return loading();case AsyncData() when data != null:
return data(_that.value);case AsyncError() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class AsyncLoading<T> implements AsyncValue<T> {
  const AsyncLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AsyncLoading<T>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AsyncValue<$T>.loading()';
}


}




/// @nodoc


class AsyncData<T> implements AsyncValue<T> {
  const AsyncData(this.value);
  

 final  T value;

/// Create a copy of AsyncValue
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AsyncDataCopyWith<T, AsyncData<T>> get copyWith => _$AsyncDataCopyWithImpl<T, AsyncData<T>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AsyncData<T>&&const DeepCollectionEquality().equals(other.value, value));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(value));

@override
String toString() {
  return 'AsyncValue<$T>.data(value: $value)';
}


}

/// @nodoc
abstract mixin class $AsyncDataCopyWith<T,$Res> implements $AsyncValueCopyWith<T, $Res> {
  factory $AsyncDataCopyWith(AsyncData<T> value, $Res Function(AsyncData<T>) _then) = _$AsyncDataCopyWithImpl;
@useResult
$Res call({
 T value
});




}
/// @nodoc
class _$AsyncDataCopyWithImpl<T,$Res>
    implements $AsyncDataCopyWith<T, $Res> {
  _$AsyncDataCopyWithImpl(this._self, this._then);

  final AsyncData<T> _self;
  final $Res Function(AsyncData<T>) _then;

/// Create a copy of AsyncValue
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? value = freezed,}) {
  return _then(AsyncData<T>(
freezed == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as T,
  ));
}


}

/// @nodoc


class AsyncError<T> implements AsyncValue<T> {
  const AsyncError(this.message);
  

 final  String message;

/// Create a copy of AsyncValue
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AsyncErrorCopyWith<T, AsyncError<T>> get copyWith => _$AsyncErrorCopyWithImpl<T, AsyncError<T>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AsyncError<T>&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'AsyncValue<$T>.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $AsyncErrorCopyWith<T,$Res> implements $AsyncValueCopyWith<T, $Res> {
  factory $AsyncErrorCopyWith(AsyncError<T> value, $Res Function(AsyncError<T>) _then) = _$AsyncErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$AsyncErrorCopyWithImpl<T,$Res>
    implements $AsyncErrorCopyWith<T, $Res> {
  _$AsyncErrorCopyWithImpl(this._self, this._then);

  final AsyncError<T> _self;
  final $Res Function(AsyncError<T>) _then;

/// Create a copy of AsyncValue
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(AsyncError<T>(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
