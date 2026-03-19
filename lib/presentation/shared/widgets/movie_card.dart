import 'package:agente_cine/config/theme/app_colors.dart';
import 'package:agente_cine/config/theme/app_dimensions.dart';
import 'package:agente_cine/core/utils/image_url_builder.dart';
import 'package:agente_cine/domain/entities/movie.dart';
import 'package:agente_cine/presentation/shared/extensions/context_extensions.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// Movie card widget (vertical)
class MovieCard extends StatelessWidget {
  const MovieCard({
    required this.movie,
    this.onTap,
    this.width = AppDimensions.movieCardWidth,
    this.height = AppDimensions.movieCardHeight,
    super.key,
  });

  final Movie movie;
  final VoidCallback? onTap;
  final double width;
  final double height;

  static const double _ratingCircleSize = 32;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ?? () => context.push('/movie/${movie.id}'),
      child: SizedBox(
        width: width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildPoster(context),
            const SizedBox(height: AppDimensions.spacingS),
            _buildTitle(context),
          ],
        ),
      ),
    );
  }

  Widget _buildPoster(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(AppDimensions.radiusM),
          child: SizedBox(
            width: width,
            height: height,
            child: movie.posterPath != null
                ? CachedNetworkImage(
                    imageUrl: ImageUrlBuilder.poster(movie.posterPath),
                    fit: BoxFit.cover,
                    placeholder: (context, url) => const ColoredBox(
                      color: AppColors.surfaceVariant,
                      child: Center(child: CircularProgressIndicator()),
                    ),
                    errorWidget: (context, url, error) => const ColoredBox(
                      color: AppColors.surfaceVariant,
                      child: Icon(Icons.movie, size: 48),
                    ),
                  )
                : const ColoredBox(
                    color: AppColors.surfaceVariant,
                    child: Icon(Icons.movie, size: 48),
                  ),
          ),
        ),
        Positioned(
          left: AppDimensions.spacingXs,
          bottom: AppDimensions.spacingXs,
          child: _buildRatingCircle(),
        ),
      ],
    );
  }

  Widget _buildRatingCircle() {
    final Color ratingColor = _getRatingColor(movie.voteAverage);
    final double progress = movie.voteAverage / 10;

    return Container(
      width: _ratingCircleSize,
      height: _ratingCircleSize,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.background.withAlpha(210),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            width: _ratingCircleSize - 4,
            height: _ratingCircleSize - 4,
            child: CircularProgressIndicator(
              value: progress,
              strokeWidth: 2.5,
              backgroundColor: ratingColor.withAlpha(60),
              valueColor: AlwaysStoppedAnimation<Color>(ratingColor),
            ),
          ),
          Text(
            movie.voteAverage.toStringAsFixed(1),
            style: const TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
            ),
          ),
        ],
      ),
    );
  }

  Color _getRatingColor(double rating) {
    if (rating >= 7.0) {
      return AppColors.ratingHigh;
    } else if (rating >= 5.0) {
      return AppColors.ratingMedium;
    } else {
      return AppColors.ratingLow;
    }
  }

  Widget _buildTitle(BuildContext context) {
    return Text(
      movie.title,
      style: context.textTheme.bodyMedium?.copyWith(
        fontWeight: FontWeight.w600,
      ),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }
}
