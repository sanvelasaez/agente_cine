// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'movie_list_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

MovieListResponseDto _$MovieListResponseDtoFromJson(Map<String, dynamic> json) {
  return _MovieListResponseDto.fromJson(json);
}

/// @nodoc
mixin _$MovieListResponseDto {
  int get page => throw _privateConstructorUsedError;
  List<MovieDto> get results => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_pages')
  int get totalPages => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_results')
  int get totalResults => throw _privateConstructorUsedError;

  /// Serializes this MovieListResponseDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MovieListResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MovieListResponseDtoCopyWith<MovieListResponseDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MovieListResponseDtoCopyWith<$Res> {
  factory $MovieListResponseDtoCopyWith(
    MovieListResponseDto value,
    $Res Function(MovieListResponseDto) then,
  ) = _$MovieListResponseDtoCopyWithImpl<$Res, MovieListResponseDto>;
  @useResult
  $Res call({
    int page,
    List<MovieDto> results,
    @JsonKey(name: 'total_pages') int totalPages,
    @JsonKey(name: 'total_results') int totalResults,
  });
}

/// @nodoc
class _$MovieListResponseDtoCopyWithImpl<
  $Res,
  $Val extends MovieListResponseDto
>
    implements $MovieListResponseDtoCopyWith<$Res> {
  _$MovieListResponseDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MovieListResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
    Object? results = null,
    Object? totalPages = null,
    Object? totalResults = null,
  }) {
    return _then(
      _value.copyWith(
            page: null == page
                ? _value.page
                : page // ignore: cast_nullable_to_non_nullable
                      as int,
            results: null == results
                ? _value.results
                : results // ignore: cast_nullable_to_non_nullable
                      as List<MovieDto>,
            totalPages: null == totalPages
                ? _value.totalPages
                : totalPages // ignore: cast_nullable_to_non_nullable
                      as int,
            totalResults: null == totalResults
                ? _value.totalResults
                : totalResults // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$MovieListResponseDtoImplCopyWith<$Res>
    implements $MovieListResponseDtoCopyWith<$Res> {
  factory _$$MovieListResponseDtoImplCopyWith(
    _$MovieListResponseDtoImpl value,
    $Res Function(_$MovieListResponseDtoImpl) then,
  ) = __$$MovieListResponseDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int page,
    List<MovieDto> results,
    @JsonKey(name: 'total_pages') int totalPages,
    @JsonKey(name: 'total_results') int totalResults,
  });
}

/// @nodoc
class __$$MovieListResponseDtoImplCopyWithImpl<$Res>
    extends _$MovieListResponseDtoCopyWithImpl<$Res, _$MovieListResponseDtoImpl>
    implements _$$MovieListResponseDtoImplCopyWith<$Res> {
  __$$MovieListResponseDtoImplCopyWithImpl(
    _$MovieListResponseDtoImpl _value,
    $Res Function(_$MovieListResponseDtoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MovieListResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
    Object? results = null,
    Object? totalPages = null,
    Object? totalResults = null,
  }) {
    return _then(
      _$MovieListResponseDtoImpl(
        page: null == page
            ? _value.page
            : page // ignore: cast_nullable_to_non_nullable
                  as int,
        results: null == results
            ? _value._results
            : results // ignore: cast_nullable_to_non_nullable
                  as List<MovieDto>,
        totalPages: null == totalPages
            ? _value.totalPages
            : totalPages // ignore: cast_nullable_to_non_nullable
                  as int,
        totalResults: null == totalResults
            ? _value.totalResults
            : totalResults // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$MovieListResponseDtoImpl implements _MovieListResponseDto {
  const _$MovieListResponseDtoImpl({
    required this.page,
    required final List<MovieDto> results,
    @JsonKey(name: 'total_pages') required this.totalPages,
    @JsonKey(name: 'total_results') required this.totalResults,
  }) : _results = results;

  factory _$MovieListResponseDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$MovieListResponseDtoImplFromJson(json);

  @override
  final int page;
  final List<MovieDto> _results;
  @override
  List<MovieDto> get results {
    if (_results is EqualUnmodifiableListView) return _results;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_results);
  }

  @override
  @JsonKey(name: 'total_pages')
  final int totalPages;
  @override
  @JsonKey(name: 'total_results')
  final int totalResults;

  @override
  String toString() {
    return 'MovieListResponseDto(page: $page, results: $results, totalPages: $totalPages, totalResults: $totalResults)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MovieListResponseDtoImpl &&
            (identical(other.page, page) || other.page == page) &&
            const DeepCollectionEquality().equals(other._results, _results) &&
            (identical(other.totalPages, totalPages) ||
                other.totalPages == totalPages) &&
            (identical(other.totalResults, totalResults) ||
                other.totalResults == totalResults));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    page,
    const DeepCollectionEquality().hash(_results),
    totalPages,
    totalResults,
  );

  /// Create a copy of MovieListResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MovieListResponseDtoImplCopyWith<_$MovieListResponseDtoImpl>
  get copyWith =>
      __$$MovieListResponseDtoImplCopyWithImpl<_$MovieListResponseDtoImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$MovieListResponseDtoImplToJson(this);
  }
}

abstract class _MovieListResponseDto implements MovieListResponseDto {
  const factory _MovieListResponseDto({
    required final int page,
    required final List<MovieDto> results,
    @JsonKey(name: 'total_pages') required final int totalPages,
    @JsonKey(name: 'total_results') required final int totalResults,
  }) = _$MovieListResponseDtoImpl;

  factory _MovieListResponseDto.fromJson(Map<String, dynamic> json) =
      _$MovieListResponseDtoImpl.fromJson;

  @override
  int get page;
  @override
  List<MovieDto> get results;
  @override
  @JsonKey(name: 'total_pages')
  int get totalPages;
  @override
  @JsonKey(name: 'total_results')
  int get totalResults;

  /// Create a copy of MovieListResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MovieListResponseDtoImplCopyWith<_$MovieListResponseDtoImpl>
  get copyWith => throw _privateConstructorUsedError;
}
