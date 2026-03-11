import 'package:flutter/material.dart';

import 'package:agente_cine/config/theme/app_dimensions.dart';
import 'package:agente_cine/domain/entities/movie.dart';
import 'package:agente_cine/presentation/common/extensions/context_extensions.dart';
import 'package:agente_cine/presentation/common/widgets/rating_stars.dart';

/// Movie title, year, runtime, and rating section
class MovieInfoSection extends StatelessWidget {
  const MovieInfoSection({
    required this.movie,
    super.key,
  });

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          movie.title,
          style: context.textTheme.headlineMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: AppDimensions.spacingS),
        Row(
          children: [
            if (movie.releaseDate != null) ...[
              Icon(
                Icons.calendar_today,
                size: AppDimensions.iconXs,
                color: context.colors.onSurface.withValues(alpha: 0.6),
              ),
              const SizedBox(width: AppDimensions.spacingXs),
              Text(
                movie.releaseYear,
                style: context.textTheme.bodyMedium?.copyWith(
                  color: context.colors.onSurface.withValues(alpha: 0.6),
                ),
              ),
              const SizedBox(width: AppDimensions.spacingM),
            ],
            if (movie.runtime != null && movie.runtime! > 0) ...[
              Icon(
                Icons.access_time,
                size: AppDimensions.iconXs,
                color: context.colors.onSurface.withValues(alpha: 0.6),
              ),
              const SizedBox(width: AppDimensions.spacingXs),
              Text(
                movie.runtimeFormatted,
                style: context.textTheme.bodyMedium?.copyWith(
                  color: context.colors.onSurface.withValues(alpha: 0.6),
                ),
              ),
            ],
          ],
        ),
        const SizedBox(height: AppDimensions.spacingM),
        RatingStars(
          rating: movie.voteAverage,
          size: AppDimensions.iconM,
        ),
      ],
    );
  }
}
