import 'package:agente_cine/domain/entities/movie.dart';
import 'package:agente_cine/domain/errors/failure.dart';
import 'package:agente_cine/domain/actions/get_movie_detail.dart';
import 'package:agente_cine/domain/actions/toggle_favorite.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie_detail_bloc.freezed.dart';
part 'movie_detail_event.dart';
part 'movie_detail_state.dart';

class MovieDetailBloc extends Bloc<MovieDetailEvent, MovieDetailState> {
  MovieDetailBloc({
    required GetMovieDetail getMovieDetail,
    required ToggleFavorite toggleFavorite,
  })  : _getMovieDetail = getMovieDetail,
        _toggleFavorite = toggleFavorite,
        super(const MovieDetailState.initial()) {
    on<_LoadMovieDetail>(_onLoadMovieDetail);
    on<_ToggleFavorite>(_onToggleFavorite);
    on<_Retry>(_onRetry);
  }

  final GetMovieDetail _getMovieDetail;
  final ToggleFavorite _toggleFavorite;

  int? _currentMovieId;

  Future<void> _onLoadMovieDetail(
    _LoadMovieDetail event,
    Emitter<MovieDetailState> emit,
  ) async {
    _currentMovieId = event.movieId;
    emit(const MovieDetailState.loading());

    final result = await _getMovieDetail(event.movieId);

    result.fold(
      (failure) => emit(MovieDetailState.error(failure.userMessage)),
      (movie) => emit(MovieDetailState.loaded(movie: movie)),
    );
  }

  Future<void> _onToggleFavorite(
    _ToggleFavorite event,
    Emitter<MovieDetailState> emit,
  ) async {
    final currentState = state;
    if (currentState is! _Loaded) {
      return;
    }

    emit(currentState.copyWith(isFavoriteLoading: true));

    final result = await _toggleFavorite(currentState.movie);

    result.fold(
      (failure) => emit(currentState.copyWith(isFavoriteLoading: false)),
      (isFavorite) {
        final updatedMovie = currentState.movie.copyWith(isFavorite: isFavorite);
        emit(
          MovieDetailState.loaded(
            movie: updatedMovie,
          ),
        );
      },
    );
  }

  Future<void> _onRetry(
    _Retry event,
    Emitter<MovieDetailState> emit,
  ) async {
    if (_currentMovieId != null) {
      add(MovieDetailEvent.loadMovieDetail(_currentMovieId!));
    }
  }
}
