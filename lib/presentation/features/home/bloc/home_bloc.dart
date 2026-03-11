import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:agente_cine/domain/entities/movie.dart';
import 'package:agente_cine/domain/usecases/get_now_playing_movies.dart';
import 'package:agente_cine/domain/usecases/get_popular_movies.dart';
import 'package:agente_cine/domain/usecases/get_top_rated_movies.dart';
import 'package:agente_cine/domain/usecases/get_trending_movies.dart';
import 'package:agente_cine/domain/usecases/get_upcoming_movies.dart';

part 'home_bloc.freezed.dart';
part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({
    required GetTrendingMovies getTrendingMovies,
    required GetPopularMovies getPopularMovies,
    required GetTopRatedMovies getTopRatedMovies,
    required GetUpcomingMovies getUpcomingMovies,
    required GetNowPlayingMovies getNowPlayingMovies,
  })  : _getTrendingMovies = getTrendingMovies,
        _getPopularMovies = getPopularMovies,
        _getTopRatedMovies = getTopRatedMovies,
        _getUpcomingMovies = getUpcomingMovies,
        _getNowPlayingMovies = getNowPlayingMovies,
        super(const HomeState()) {
    on<_Started>(_onStarted);
    on<_Refresh>(_onRefresh);
  }

  final GetTrendingMovies _getTrendingMovies;
  final GetPopularMovies _getPopularMovies;
  final GetTopRatedMovies _getTopRatedMovies;
  final GetUpcomingMovies _getUpcomingMovies;
  final GetNowPlayingMovies _getNowPlayingMovies;

  Future<void> _onStarted(_Started event, Emitter<HomeState> emit) async {
    await _loadAllLists(emit);
  }

  Future<void> _onRefresh(_Refresh event, Emitter<HomeState> emit) async {
    emit(const HomeState()); // Reset to loading
    await _loadAllLists(emit);
  }

  Future<void> _loadAllLists(Emitter<HomeState> emit) async {
    // Load all lists in parallel
    final results = await Future.wait([
      _getTrendingMovies(),
      _getPopularMovies(),
      _getTopRatedMovies(),
      _getUpcomingMovies(),
      _getNowPlayingMovies(),
    ]);

    emit(
      state.copyWith(
        trending: results[0].fold(
          (failure) => AsyncValue.error(failure.userMessage),
          (movies) => AsyncValue.data(movies),
        ),
        popular: results[1].fold(
          (failure) => AsyncValue.error(failure.userMessage),
          (movies) => AsyncValue.data(movies),
        ),
        topRated: results[2].fold(
          (failure) => AsyncValue.error(failure.userMessage),
          (movies) => AsyncValue.data(movies),
        ),
        upcoming: results[3].fold(
          (failure) => AsyncValue.error(failure.userMessage),
          (movies) => AsyncValue.data(movies),
        ),
        nowPlaying: results[4].fold(
          (failure) => AsyncValue.error(failure.userMessage),
          (movies) => AsyncValue.data(movies),
        ),
      ),
    );
  }
}
