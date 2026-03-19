import 'package:agente_cine/config/dependencies/injection.dart';
import 'package:agente_cine/config/theme/app_dimensions.dart';
import 'package:agente_cine/domain/actions/get_now_playing_movies.dart';
import 'package:agente_cine/domain/actions/get_popular_movies.dart';
import 'package:agente_cine/domain/actions/get_top_rated_movies.dart';
import 'package:agente_cine/domain/actions/get_trending_movies.dart';
import 'package:agente_cine/domain/actions/get_upcoming_movies.dart';
import 'package:agente_cine/presentation/screens/home/bloc/home_bloc.dart';
import 'package:agente_cine/presentation/screens/home/widgets/movie_horizontal_list.dart';
import 'package:agente_cine/presentation/screens/home/widgets/section_header.dart';
import 'package:agente_cine/presentation/search/movie_search_delegate.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Home page with multiple movie lists
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(
        getTrendingMovies: getIt<GetTrendingMovies>(),
        getPopularMovies: getIt<GetPopularMovies>(),
        getTopRatedMovies: getIt<GetTopRatedMovies>(),
        getUpcomingMovies: getIt<GetUpcomingMovies>(),
        getNowPlayingMovies: getIt<GetNowPlayingMovies>(),
      )..add(const HomeEvent.started()),
      child: const _HomeView(),
    );
  }
}

class _HomeView extends StatelessWidget {
  const _HomeView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AgenteCine'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              showSearch(context: context, delegate: MovieSearchDelegate());
            },
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          context.read<HomeBloc>().add(const HomeEvent.refresh());
        },
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FadeInLeft(
                    duration: const Duration(milliseconds: 400),
                    child: const SectionHeader(title: 'Trending Now'),
                  ),
                  FadeIn(
                    child: MovieHorizontalList(
                      asyncValue: state.trending,
                      onRetry: () => context
                          .read<HomeBloc>()
                          .add(const HomeEvent.refresh()),
                    ),
                  ),
                  const SizedBox(height: AppDimensions.spacingL),
                  FadeInLeft(
                    duration: const Duration(milliseconds: 400),
                    delay: const Duration(milliseconds: 100),
                    child: const SectionHeader(title: 'Popular'),
                  ),
                  FadeIn(
                    delay: const Duration(milliseconds: 150),
                    child: MovieHorizontalList(
                      asyncValue: state.popular,
                      onRetry: () => context
                          .read<HomeBloc>()
                          .add(const HomeEvent.refresh()),
                    ),
                  ),
                  const SizedBox(height: AppDimensions.spacingL),
                  FadeInLeft(
                    duration: const Duration(milliseconds: 400),
                    delay: const Duration(milliseconds: 200),
                    child: const SectionHeader(title: 'Top Rated'),
                  ),
                  FadeIn(
                    delay: const Duration(milliseconds: 250),
                    child: MovieHorizontalList(
                      asyncValue: state.topRated,
                      onRetry: () => context
                          .read<HomeBloc>()
                          .add(const HomeEvent.refresh()),
                    ),
                  ),
                  const SizedBox(height: AppDimensions.spacingL),
                  FadeInLeft(
                    duration: const Duration(milliseconds: 400),
                    delay: const Duration(milliseconds: 300),
                    child: const SectionHeader(title: 'Upcoming'),
                  ),
                  FadeIn(
                    delay: const Duration(milliseconds: 350),
                    child: MovieHorizontalList(
                      asyncValue: state.upcoming,
                      onRetry: () => context
                          .read<HomeBloc>()
                          .add(const HomeEvent.refresh()),
                    ),
                  ),
                  const SizedBox(height: AppDimensions.spacingL),
                  FadeInLeft(
                    duration: const Duration(milliseconds: 400),
                    delay: const Duration(milliseconds: 400),
                    child: const SectionHeader(title: 'Now Playing'),
                  ),
                  FadeIn(
                    delay: const Duration(milliseconds: 450),
                    child: MovieHorizontalList(
                      asyncValue: state.nowPlaying,
                      onRetry: () => context
                          .read<HomeBloc>()
                          .add(const HomeEvent.refresh()),
                    ),
                  ),
                  const SizedBox(height: AppDimensions.spacingL),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
