import 'package:agente_cine/config/dependencies/injection.dart';
import 'package:agente_cine/config/theme/app_dimensions.dart';
import 'package:agente_cine/domain/actions/get_movie_detail.dart';
import 'package:agente_cine/domain/actions/toggle_favorite.dart';
import 'package:agente_cine/presentation/screens/movie_detail/bloc/movie_detail_bloc.dart';
import 'package:agente_cine/presentation/screens/movie_detail/widgets/movie_backdrop.dart';
import 'package:agente_cine/presentation/screens/movie_detail/widgets/movie_cast_section.dart';
import 'package:agente_cine/presentation/screens/movie_detail/widgets/movie_genres_section.dart';
import 'package:agente_cine/presentation/screens/movie_detail/widgets/movie_info_section.dart';
import 'package:agente_cine/presentation/screens/movie_detail/widgets/movie_overview_section.dart';
import 'package:agente_cine/presentation/shared/widgets/error_view.dart';
import 'package:agente_cine/presentation/shared/widgets/loading_indicator.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

/// Movie detail page
class MovieDetailPage extends StatelessWidget {
  const MovieDetailPage({required this.movieId, super.key});

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
            initial: () => _buildNonLoadedState(
              context,
              const LoadingIndicator(),
            ),
            loading: () => _buildNonLoadedState(
              context,
              const LoadingIndicator(),
            ),
            loaded: (movie, isFavoriteLoading) => CustomScrollView(
              slivers: [
                SliverAppBar(
                  expandedHeight: MediaQuery.of(context).size.width * 0.6,
                  pinned: true,
                  leading: IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () => context.pop(),
                  ),
                  flexibleSpace: FlexibleSpaceBar(
                    background:
                        MovieBackdrop(backdropPath: movie.backdropPath),
                  ),
                  actions: [
                    IconButton(
                      onPressed: isFavoriteLoading
                          ? null
                          : () => context.read<MovieDetailBloc>().add(
                                const MovieDetailEvent.toggleFavorite(),
                              ),
                      icon: isFavoriteLoading
                          ? const SizedBox(
                              width: 24,
                              height: 24,
                              child:
                                  CircularProgressIndicator(strokeWidth: 2),
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
                      FadeInUp(
                        duration: const Duration(milliseconds: 400),
                        child: MovieInfoSection(movie: movie),
                      ),
                      const SizedBox(height: AppDimensions.spacingL),
                      FadeInUp(
                        duration: const Duration(milliseconds: 400),
                        delay: const Duration(milliseconds: 100),
                        child: MovieOverviewSection(overview: movie.overview),
                      ),
                      const SizedBox(height: AppDimensions.spacingL),
                      FadeInUp(
                        duration: const Duration(milliseconds: 400),
                        delay: const Duration(milliseconds: 200),
                        child: MovieGenresSection(genres: movie.genres),
                      ),
                      const SizedBox(height: AppDimensions.spacingL),
                      FadeInUp(
                        duration: const Duration(milliseconds: 400),
                        delay: const Duration(milliseconds: 300),
                        child: MovieCastSection(cast: movie.cast),
                      ),
                      const SizedBox(height: AppDimensions.spacingXl),
                    ]),
                  ),
                ),
              ],
            ),
            error: (message) => _buildNonLoadedState(
              context,
              ErrorView(
                message: message,
                onRetry: () => context.read<MovieDetailBloc>().add(
                      const MovieDetailEvent.retry(),
                    ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildNonLoadedState(BuildContext context, Widget child) {
    return Column(
      children: [
        AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => context.pop(),
          ),
        ),
        Expanded(child: child),
      ],
    );
  }
}
