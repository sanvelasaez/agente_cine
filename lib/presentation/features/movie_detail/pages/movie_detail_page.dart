import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:agente_cine/config/di/injection.dart';
import 'package:agente_cine/config/theme/app_dimensions.dart';
import 'package:agente_cine/domain/usecases/get_movie_detail.dart';
import 'package:agente_cine/domain/usecases/toggle_favorite.dart';
import 'package:agente_cine/presentation/common/widgets/error_view.dart';
import 'package:agente_cine/presentation/common/widgets/loading_indicator.dart';
import 'package:agente_cine/presentation/features/movie_detail/bloc/movie_detail_bloc.dart';
import 'package:agente_cine/presentation/features/movie_detail/widgets/movie_backdrop.dart';
import 'package:agente_cine/presentation/features/movie_detail/widgets/movie_cast_section.dart';
import 'package:agente_cine/presentation/features/movie_detail/widgets/movie_genres_section.dart';
import 'package:agente_cine/presentation/features/movie_detail/widgets/movie_info_section.dart';
import 'package:agente_cine/presentation/features/movie_detail/widgets/movie_overview_section.dart';

/// Movie detail page
class MovieDetailPage extends StatelessWidget {
  const MovieDetailPage({
    required this.movieId,
    super.key,
  });

  final int movieId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MovieDetailBloc(
        getMovieDetail: getIt<GetMovieDetail>(),
        toggleFavorite: getIt<ToggleFavorite>(),
      )..add(MovieDetailEvent.loadMovieDetail(movieId)),
      child: const _MovieDetailView(),
    );
  }
}

class _MovieDetailView extends StatelessWidget {
  const _MovieDetailView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<MovieDetailBloc, MovieDetailState>(
        builder: (context, state) {
          return state.when(
            initial: () => const LoadingIndicator(),
            loading: () => const LoadingIndicator(),
            loaded: (movie, isFavoriteLoading) => CustomScrollView(
              slivers: [
                SliverAppBar(
                  expandedHeight: MediaQuery.of(context).size.width * 0.6,
                  pinned: true,
                  flexibleSpace: FlexibleSpaceBar(
                    background: MovieBackdrop(backdropPath: movie.backdropPath),
                  ),
                  actions: [
                    IconButton(
                      onPressed: isFavoriteLoading
                          ? null
                          : () => context
                              .read<MovieDetailBloc>()
                              .add(const MovieDetailEvent.toggleFavorite()),
                      icon: isFavoriteLoading
                          ? const SizedBox(
                              width: 24,
                              height: 24,
                              child: CircularProgressIndicator(strokeWidth: 2),
                            )
                          : Icon(
                              movie.isFavorite
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              color: movie.isFavorite ? Colors.red : null,
                            ),
                    ),
                  ],
                ),
                SliverPadding(
                  padding: const EdgeInsets.all(AppDimensions.spacingM),
                  sliver: SliverList(
                    delegate: SliverChildListDelegate([
                      MovieInfoSection(movie: movie),
                      const SizedBox(height: AppDimensions.spacingL),
                      MovieOverviewSection(overview: movie.overview),
                      const SizedBox(height: AppDimensions.spacingL),
                      MovieGenresSection(genres: movie.genres),
                      const SizedBox(height: AppDimensions.spacingL),
                      MovieCastSection(cast: movie.cast),
                      const SizedBox(height: AppDimensions.spacingXl),
                    ]),
                  ),
                ),
              ],
            ),
            error: (message) => ErrorView(
              message: message,
              onRetry: () => context
                  .read<MovieDetailBloc>()
                  .add(const MovieDetailEvent.retry()),
            ),
          );
        },
      ),
    );
  }
}
