// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$HomeEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() refresh,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? refresh,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? refresh,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_Refresh value) refresh,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_Refresh value)? refresh,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_Refresh value)? refresh,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeEventCopyWith<$Res> {
  factory $HomeEventCopyWith(HomeEvent value, $Res Function(HomeEvent) then) =
      _$HomeEventCopyWithImpl<$Res, HomeEvent>;
}

/// @nodoc
class _$HomeEventCopyWithImpl<$Res, $Val extends HomeEvent>
    implements $HomeEventCopyWith<$Res> {
  _$HomeEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HomeEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$StartedImplCopyWith<$Res> {
  factory _$$StartedImplCopyWith(
    _$StartedImpl value,
    $Res Function(_$StartedImpl) then,
  ) = __$$StartedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$StartedImplCopyWithImpl<$Res>
    extends _$HomeEventCopyWithImpl<$Res, _$StartedImpl>
    implements _$$StartedImplCopyWith<$Res> {
  __$$StartedImplCopyWithImpl(
    _$StartedImpl _value,
    $Res Function(_$StartedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of HomeEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$StartedImpl implements _Started {
  const _$StartedImpl();

  @override
  String toString() {
    return 'HomeEvent.started()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$StartedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() refresh,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? refresh,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? refresh,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_Refresh value) refresh,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_Refresh value)? refresh,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_Refresh value)? refresh,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements HomeEvent {
  const factory _Started() = _$StartedImpl;
}

/// @nodoc
abstract class _$$RefreshImplCopyWith<$Res> {
  factory _$$RefreshImplCopyWith(
    _$RefreshImpl value,
    $Res Function(_$RefreshImpl) then,
  ) = __$$RefreshImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RefreshImplCopyWithImpl<$Res>
    extends _$HomeEventCopyWithImpl<$Res, _$RefreshImpl>
    implements _$$RefreshImplCopyWith<$Res> {
  __$$RefreshImplCopyWithImpl(
    _$RefreshImpl _value,
    $Res Function(_$RefreshImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of HomeEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$RefreshImpl implements _Refresh {
  const _$RefreshImpl();

  @override
  String toString() {
    return 'HomeEvent.refresh()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$RefreshImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() refresh,
  }) {
    return refresh();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? refresh,
  }) {
    return refresh?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? refresh,
    required TResult orElse(),
  }) {
    if (refresh != null) {
      return refresh();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_Refresh value) refresh,
  }) {
    return refresh(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_Refresh value)? refresh,
  }) {
    return refresh?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_Refresh value)? refresh,
    required TResult orElse(),
  }) {
    if (refresh != null) {
      return refresh(this);
    }
    return orElse();
  }
}

abstract class _Refresh implements HomeEvent {
  const factory _Refresh() = _$RefreshImpl;
}

/// @nodoc
mixin _$HomeState {
  AsyncValue<List<Movie>> get trending => throw _privateConstructorUsedError;
  AsyncValue<List<Movie>> get popular => throw _privateConstructorUsedError;
  AsyncValue<List<Movie>> get topRated => throw _privateConstructorUsedError;
  AsyncValue<List<Movie>> get upcoming => throw _privateConstructorUsedError;
  AsyncValue<List<Movie>> get nowPlaying => throw _privateConstructorUsedError;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HomeStateCopyWith<HomeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeStateCopyWith<$Res> {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) then) =
      _$HomeStateCopyWithImpl<$Res, HomeState>;
  @useResult
  $Res call({
    AsyncValue<List<Movie>> trending,
    AsyncValue<List<Movie>> popular,
    AsyncValue<List<Movie>> topRated,
    AsyncValue<List<Movie>> upcoming,
    AsyncValue<List<Movie>> nowPlaying,
  });

  $AsyncValueCopyWith<List<Movie>, $Res> get trending;
  $AsyncValueCopyWith<List<Movie>, $Res> get popular;
  $AsyncValueCopyWith<List<Movie>, $Res> get topRated;
  $AsyncValueCopyWith<List<Movie>, $Res> get upcoming;
  $AsyncValueCopyWith<List<Movie>, $Res> get nowPlaying;
}

/// @nodoc
class _$HomeStateCopyWithImpl<$Res, $Val extends HomeState>
    implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? trending = null,
    Object? popular = null,
    Object? topRated = null,
    Object? upcoming = null,
    Object? nowPlaying = null,
  }) {
    return _then(
      _value.copyWith(
            trending: null == trending
                ? _value.trending
                : trending // ignore: cast_nullable_to_non_nullable
                      as AsyncValue<List<Movie>>,
            popular: null == popular
                ? _value.popular
                : popular // ignore: cast_nullable_to_non_nullable
                      as AsyncValue<List<Movie>>,
            topRated: null == topRated
                ? _value.topRated
                : topRated // ignore: cast_nullable_to_non_nullable
                      as AsyncValue<List<Movie>>,
            upcoming: null == upcoming
                ? _value.upcoming
                : upcoming // ignore: cast_nullable_to_non_nullable
                      as AsyncValue<List<Movie>>,
            nowPlaying: null == nowPlaying
                ? _value.nowPlaying
                : nowPlaying // ignore: cast_nullable_to_non_nullable
                      as AsyncValue<List<Movie>>,
          )
          as $Val,
    );
  }

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AsyncValueCopyWith<List<Movie>, $Res> get trending {
    return $AsyncValueCopyWith<List<Movie>, $Res>(_value.trending, (value) {
      return _then(_value.copyWith(trending: value) as $Val);
    });
  }

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AsyncValueCopyWith<List<Movie>, $Res> get popular {
    return $AsyncValueCopyWith<List<Movie>, $Res>(_value.popular, (value) {
      return _then(_value.copyWith(popular: value) as $Val);
    });
  }

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AsyncValueCopyWith<List<Movie>, $Res> get topRated {
    return $AsyncValueCopyWith<List<Movie>, $Res>(_value.topRated, (value) {
      return _then(_value.copyWith(topRated: value) as $Val);
    });
  }

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AsyncValueCopyWith<List<Movie>, $Res> get upcoming {
    return $AsyncValueCopyWith<List<Movie>, $Res>(_value.upcoming, (value) {
      return _then(_value.copyWith(upcoming: value) as $Val);
    });
  }

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AsyncValueCopyWith<List<Movie>, $Res> get nowPlaying {
    return $AsyncValueCopyWith<List<Movie>, $Res>(_value.nowPlaying, (value) {
      return _then(_value.copyWith(nowPlaying: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$HomeStateImplCopyWith<$Res>
    implements $HomeStateCopyWith<$Res> {
  factory _$$HomeStateImplCopyWith(
    _$HomeStateImpl value,
    $Res Function(_$HomeStateImpl) then,
  ) = __$$HomeStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    AsyncValue<List<Movie>> trending,
    AsyncValue<List<Movie>> popular,
    AsyncValue<List<Movie>> topRated,
    AsyncValue<List<Movie>> upcoming,
    AsyncValue<List<Movie>> nowPlaying,
  });

  @override
  $AsyncValueCopyWith<List<Movie>, $Res> get trending;
  @override
  $AsyncValueCopyWith<List<Movie>, $Res> get popular;
  @override
  $AsyncValueCopyWith<List<Movie>, $Res> get topRated;
  @override
  $AsyncValueCopyWith<List<Movie>, $Res> get upcoming;
  @override
  $AsyncValueCopyWith<List<Movie>, $Res> get nowPlaying;
}

/// @nodoc
class __$$HomeStateImplCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$HomeStateImpl>
    implements _$$HomeStateImplCopyWith<$Res> {
  __$$HomeStateImplCopyWithImpl(
    _$HomeStateImpl _value,
    $Res Function(_$HomeStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? trending = null,
    Object? popular = null,
    Object? topRated = null,
    Object? upcoming = null,
    Object? nowPlaying = null,
  }) {
    return _then(
      _$HomeStateImpl(
        trending: null == trending
            ? _value.trending
            : trending // ignore: cast_nullable_to_non_nullable
                  as AsyncValue<List<Movie>>,
        popular: null == popular
            ? _value.popular
            : popular // ignore: cast_nullable_to_non_nullable
                  as AsyncValue<List<Movie>>,
        topRated: null == topRated
            ? _value.topRated
            : topRated // ignore: cast_nullable_to_non_nullable
                  as AsyncValue<List<Movie>>,
        upcoming: null == upcoming
            ? _value.upcoming
            : upcoming // ignore: cast_nullable_to_non_nullable
                  as AsyncValue<List<Movie>>,
        nowPlaying: null == nowPlaying
            ? _value.nowPlaying
            : nowPlaying // ignore: cast_nullable_to_non_nullable
                  as AsyncValue<List<Movie>>,
      ),
    );
  }
}

/// @nodoc

class _$HomeStateImpl implements _HomeState {
  const _$HomeStateImpl({
    this.trending = const AsyncValue.loading(),
    this.popular = const AsyncValue.loading(),
    this.topRated = const AsyncValue.loading(),
    this.upcoming = const AsyncValue.loading(),
    this.nowPlaying = const AsyncValue.loading(),
  });

  @override
  @JsonKey()
  final AsyncValue<List<Movie>> trending;
  @override
  @JsonKey()
  final AsyncValue<List<Movie>> popular;
  @override
  @JsonKey()
  final AsyncValue<List<Movie>> topRated;
  @override
  @JsonKey()
  final AsyncValue<List<Movie>> upcoming;
  @override
  @JsonKey()
  final AsyncValue<List<Movie>> nowPlaying;

  @override
  String toString() {
    return 'HomeState(trending: $trending, popular: $popular, topRated: $topRated, upcoming: $upcoming, nowPlaying: $nowPlaying)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomeStateImpl &&
            (identical(other.trending, trending) ||
                other.trending == trending) &&
            (identical(other.popular, popular) || other.popular == popular) &&
            (identical(other.topRated, topRated) ||
                other.topRated == topRated) &&
            (identical(other.upcoming, upcoming) ||
                other.upcoming == upcoming) &&
            (identical(other.nowPlaying, nowPlaying) ||
                other.nowPlaying == nowPlaying));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    trending,
    popular,
    topRated,
    upcoming,
    nowPlaying,
  );

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HomeStateImplCopyWith<_$HomeStateImpl> get copyWith =>
      __$$HomeStateImplCopyWithImpl<_$HomeStateImpl>(this, _$identity);
}

abstract class _HomeState implements HomeState {
  const factory _HomeState({
    final AsyncValue<List<Movie>> trending,
    final AsyncValue<List<Movie>> popular,
    final AsyncValue<List<Movie>> topRated,
    final AsyncValue<List<Movie>> upcoming,
    final AsyncValue<List<Movie>> nowPlaying,
  }) = _$HomeStateImpl;

  @override
  AsyncValue<List<Movie>> get trending;
  @override
  AsyncValue<List<Movie>> get popular;
  @override
  AsyncValue<List<Movie>> get topRated;
  @override
  AsyncValue<List<Movie>> get upcoming;
  @override
  AsyncValue<List<Movie>> get nowPlaying;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HomeStateImplCopyWith<_$HomeStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$AsyncValue<T> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(T value) data,
    required TResult Function(String message) error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(T value)? data,
    TResult? Function(String message)? error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(T value)? data,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AsyncLoading<T> value) loading,
    required TResult Function(AsyncData<T> value) data,
    required TResult Function(AsyncError<T> value) error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AsyncLoading<T> value)? loading,
    TResult? Function(AsyncData<T> value)? data,
    TResult? Function(AsyncError<T> value)? error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AsyncLoading<T> value)? loading,
    TResult Function(AsyncData<T> value)? data,
    TResult Function(AsyncError<T> value)? error,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AsyncValueCopyWith<T, $Res> {
  factory $AsyncValueCopyWith(
    AsyncValue<T> value,
    $Res Function(AsyncValue<T>) then,
  ) = _$AsyncValueCopyWithImpl<T, $Res, AsyncValue<T>>;
}

/// @nodoc
class _$AsyncValueCopyWithImpl<T, $Res, $Val extends AsyncValue<T>>
    implements $AsyncValueCopyWith<T, $Res> {
  _$AsyncValueCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AsyncValue
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$AsyncLoadingImplCopyWith<T, $Res> {
  factory _$$AsyncLoadingImplCopyWith(
    _$AsyncLoadingImpl<T> value,
    $Res Function(_$AsyncLoadingImpl<T>) then,
  ) = __$$AsyncLoadingImplCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$AsyncLoadingImplCopyWithImpl<T, $Res>
    extends _$AsyncValueCopyWithImpl<T, $Res, _$AsyncLoadingImpl<T>>
    implements _$$AsyncLoadingImplCopyWith<T, $Res> {
  __$$AsyncLoadingImplCopyWithImpl(
    _$AsyncLoadingImpl<T> _value,
    $Res Function(_$AsyncLoadingImpl<T>) _then,
  ) : super(_value, _then);

  /// Create a copy of AsyncValue
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$AsyncLoadingImpl<T> implements AsyncLoading<T> {
  const _$AsyncLoadingImpl();

  @override
  String toString() {
    return 'AsyncValue<$T>.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AsyncLoadingImpl<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(T value) data,
    required TResult Function(String message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(T value)? data,
    TResult? Function(String message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(T value)? data,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AsyncLoading<T> value) loading,
    required TResult Function(AsyncData<T> value) data,
    required TResult Function(AsyncError<T> value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AsyncLoading<T> value)? loading,
    TResult? Function(AsyncData<T> value)? data,
    TResult? Function(AsyncError<T> value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AsyncLoading<T> value)? loading,
    TResult Function(AsyncData<T> value)? data,
    TResult Function(AsyncError<T> value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class AsyncLoading<T> implements AsyncValue<T> {
  const factory AsyncLoading() = _$AsyncLoadingImpl<T>;
}

/// @nodoc
abstract class _$$AsyncDataImplCopyWith<T, $Res> {
  factory _$$AsyncDataImplCopyWith(
    _$AsyncDataImpl<T> value,
    $Res Function(_$AsyncDataImpl<T>) then,
  ) = __$$AsyncDataImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({T value});
}

/// @nodoc
class __$$AsyncDataImplCopyWithImpl<T, $Res>
    extends _$AsyncValueCopyWithImpl<T, $Res, _$AsyncDataImpl<T>>
    implements _$$AsyncDataImplCopyWith<T, $Res> {
  __$$AsyncDataImplCopyWithImpl(
    _$AsyncDataImpl<T> _value,
    $Res Function(_$AsyncDataImpl<T>) _then,
  ) : super(_value, _then);

  /// Create a copy of AsyncValue
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? value = freezed}) {
    return _then(
      _$AsyncDataImpl<T>(
        freezed == value
            ? _value.value
            : value // ignore: cast_nullable_to_non_nullable
                  as T,
      ),
    );
  }
}

/// @nodoc

class _$AsyncDataImpl<T> implements AsyncData<T> {
  const _$AsyncDataImpl(this.value);

  @override
  final T value;

  @override
  String toString() {
    return 'AsyncValue<$T>.data(value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AsyncDataImpl<T> &&
            const DeepCollectionEquality().equals(other.value, value));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(value));

  /// Create a copy of AsyncValue
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AsyncDataImplCopyWith<T, _$AsyncDataImpl<T>> get copyWith =>
      __$$AsyncDataImplCopyWithImpl<T, _$AsyncDataImpl<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(T value) data,
    required TResult Function(String message) error,
  }) {
    return data(value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(T value)? data,
    TResult? Function(String message)? error,
  }) {
    return data?.call(value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(T value)? data,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AsyncLoading<T> value) loading,
    required TResult Function(AsyncData<T> value) data,
    required TResult Function(AsyncError<T> value) error,
  }) {
    return data(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AsyncLoading<T> value)? loading,
    TResult? Function(AsyncData<T> value)? data,
    TResult? Function(AsyncError<T> value)? error,
  }) {
    return data?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AsyncLoading<T> value)? loading,
    TResult Function(AsyncData<T> value)? data,
    TResult Function(AsyncError<T> value)? error,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(this);
    }
    return orElse();
  }
}

abstract class AsyncData<T> implements AsyncValue<T> {
  const factory AsyncData(final T value) = _$AsyncDataImpl<T>;

  T get value;

  /// Create a copy of AsyncValue
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AsyncDataImplCopyWith<T, _$AsyncDataImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AsyncErrorImplCopyWith<T, $Res> {
  factory _$$AsyncErrorImplCopyWith(
    _$AsyncErrorImpl<T> value,
    $Res Function(_$AsyncErrorImpl<T>) then,
  ) = __$$AsyncErrorImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$AsyncErrorImplCopyWithImpl<T, $Res>
    extends _$AsyncValueCopyWithImpl<T, $Res, _$AsyncErrorImpl<T>>
    implements _$$AsyncErrorImplCopyWith<T, $Res> {
  __$$AsyncErrorImplCopyWithImpl(
    _$AsyncErrorImpl<T> _value,
    $Res Function(_$AsyncErrorImpl<T>) _then,
  ) : super(_value, _then);

  /// Create a copy of AsyncValue
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null}) {
    return _then(
      _$AsyncErrorImpl<T>(
        null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$AsyncErrorImpl<T> implements AsyncError<T> {
  const _$AsyncErrorImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'AsyncValue<$T>.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AsyncErrorImpl<T> &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of AsyncValue
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AsyncErrorImplCopyWith<T, _$AsyncErrorImpl<T>> get copyWith =>
      __$$AsyncErrorImplCopyWithImpl<T, _$AsyncErrorImpl<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(T value) data,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(T value)? data,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(T value)? data,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AsyncLoading<T> value) loading,
    required TResult Function(AsyncData<T> value) data,
    required TResult Function(AsyncError<T> value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AsyncLoading<T> value)? loading,
    TResult? Function(AsyncData<T> value)? data,
    TResult? Function(AsyncError<T> value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AsyncLoading<T> value)? loading,
    TResult Function(AsyncData<T> value)? data,
    TResult Function(AsyncError<T> value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class AsyncError<T> implements AsyncValue<T> {
  const factory AsyncError(final String message) = _$AsyncErrorImpl<T>;

  String get message;

  /// Create a copy of AsyncValue
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AsyncErrorImplCopyWith<T, _$AsyncErrorImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
