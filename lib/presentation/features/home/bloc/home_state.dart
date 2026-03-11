part of 'home_bloc.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    @Default(AsyncValue.loading()) AsyncValue<List<Movie>> trending,
    @Default(AsyncValue.loading()) AsyncValue<List<Movie>> popular,
    @Default(AsyncValue.loading()) AsyncValue<List<Movie>> topRated,
    @Default(AsyncValue.loading()) AsyncValue<List<Movie>> upcoming,
    @Default(AsyncValue.loading()) AsyncValue<List<Movie>> nowPlaying,
  }) = _HomeState;
}

/// Helper to represent async values
@freezed
class AsyncValue<T> with _$AsyncValue<T> {
  const factory AsyncValue.loading() = AsyncLoading<T>;
  const factory AsyncValue.data(T value) = AsyncData<T>;
  const factory AsyncValue.error(String message) = AsyncError<T>;
}
