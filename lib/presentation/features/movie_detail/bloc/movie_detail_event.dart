part of 'movie_detail_bloc.dart';

@freezed
class MovieDetailEvent with _$MovieDetailEvent {
  const factory MovieDetailEvent.loadMovieDetail(int movieId) = _LoadMovieDetail;
  const factory MovieDetailEvent.toggleFavorite() = _ToggleFavorite;
  const factory MovieDetailEvent.retry() = _Retry;
}
