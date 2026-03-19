import 'package:agente_cine/config/router/app_routes.dart';
import 'package:agente_cine/config/theme/app_dimensions.dart';
import 'package:agente_cine/domain/entities/movie.dart';
import 'package:agente_cine/presentation/screens/home/bloc/home_bloc.dart';
import 'package:agente_cine/presentation/shared/widgets/empty_state.dart';
import 'package:agente_cine/presentation/shared/widgets/error_view.dart';
import 'package:agente_cine/presentation/shared/widgets/loading_indicator.dart';
import 'package:agente_cine/presentation/shared/widgets/movie_card.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// Horizontal scrolling list of movies
class MovieHorizontalList extends StatelessWidget {
  const MovieHorizontalList({
    required this.asyncValue,
    this.onRetry,
    super.key,
  });

  final AsyncValue<List<Movie>> asyncValue;
  final VoidCallback? onRetry;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppDimensions.movieCardHeight + 60,
      child: asyncValue.when(
        loading: () => const LoadingIndicator(),
        error: (message) => onRetry != null
            ? ErrorView(message: message, onRetry: onRetry!)
            : Center(child: Text(message)),
        data: (movies) {
          if (movies.isEmpty) {
            return const EmptyState(
              message: 'No movies found',
              icon: Icons.movie_outlined,
            );
          }

          return ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(
              horizontal: AppDimensions.spacingM,
            ),
            itemCount: movies.length,
            separatorBuilder: (context, index) =>
                const SizedBox(width: AppDimensions.spacingM),
            itemBuilder: (context, index) {
              final movie = movies[index];
              return FadeInRight(
                duration: const Duration(milliseconds: 300),
                delay: Duration(milliseconds: 50 * index.clamp(0, 6)),
                child: MovieCard(
                  movie: movie,
                  onTap: () => context.push(
                    AppRoutes.movieDetail.replaceAll(':id', '${movie.id}'),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
