import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:agente_cine/config/di/injection.dart';
import 'package:agente_cine/config/theme/app_dimensions.dart';
import 'package:agente_cine/domain/usecases/get_now_playing_movies.dart';
import 'package:agente_cine/domain/usecases/get_popular_movies.dart';
import 'package:agente_cine/domain/usecases/get_top_rated_movies.dart';
import 'package:agente_cine/domain/usecases/get_trending_movies.dart';
import 'package:agente_cine/domain/usecases/get_upcoming_movies.dart';
import 'package:agente_cine/presentation/features/home/bloc/home_bloc.dart';
import 'package:agente_cine/presentation/features/home/widgets/movie_horizontal_list.dart';
import 'package:agente_cine/presentation/features/home/widgets/section_header.dart';

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
              // TODO: Navigate to search
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
                  const SectionHeader(title: 'Trending Now'),
                  MovieHorizontalList(
                    asyncValue: state.trending,
                    onRetry: () => context.read<HomeBloc>().add(
                          const HomeEvent.refresh(),
                        ),
                  ),
                  const SizedBox(height: AppDimensions.spacingL),
                  const SectionHeader(title: 'Popular'),
                  MovieHorizontalList(
                    asyncValue: state.popular,
                    onRetry: () => context.read<HomeBloc>().add(
                          const HomeEvent.refresh(),
                        ),
                  ),
                  const SizedBox(height: AppDimensions.spacingL),
                  const SectionHeader(title: 'Top Rated'),
                  MovieHorizontalList(
                    asyncValue: state.topRated,
                    onRetry: () => context.read<HomeBloc>().add(
                          const HomeEvent.refresh(),
                        ),
                  ),
                  const SizedBox(height: AppDimensions.spacingL),
                  const SectionHeader(title: 'Upcoming'),
                  MovieHorizontalList(
                    asyncValue: state.upcoming,
                    onRetry: () => context.read<HomeBloc>().add(
                          const HomeEvent.refresh(),
                        ),
                  ),
                  const SizedBox(height: AppDimensions.spacingL),
                  const SectionHeader(title: 'Now Playing'),
                  MovieHorizontalList(
                    asyncValue: state.nowPlaying,
                    onRetry: () => context.read<HomeBloc>().add(
                          const HomeEvent.refresh(),
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
