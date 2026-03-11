part of 'movie_detail_bloc.dart';

@freezed
class MovieDetailState with _$MovieDetailState {
  const factory MovieDetailState.initial() = _Initial;
  const factory MovieDetailState.loading() = _Loading;
  const factory MovieDetailState.loaded({
    required Movie movie,
    @Default(false) bool isFavoriteLoading,
  }) = _Loaded;
  const factory MovieDetailState.error(String message) = _Error;
}
