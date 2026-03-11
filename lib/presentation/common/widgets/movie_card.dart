import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:agente_cine/config/theme/app_colors.dart';
import 'package:agente_cine/config/theme/app_dimensions.dart';
import 'package:agente_cine/core/utils/image_url_builder.dart';
import 'package:agente_cine/domain/entities/movie.dart';
import 'package:agente_cine/presentation/common/extensions/context_extensions.dart';
import 'package:agente_cine/presentation/common/widgets/rating_stars.dart';

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

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildPoster(context),
            const SizedBox(height: AppDimensions.spacingS),
            _buildTitle(context),
            const SizedBox(height: AppDimensions.spacingXs),
            RatingStars(rating: movie.voteAverage, size: 14),
          ],
        ),
      ),
    );
  }

  Widget _buildPoster(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(AppDimensions.radiusM),
      child: SizedBox(
        width: width,
        height: height,
        child: movie.posterPath != null
            ? CachedNetworkImage(
                imageUrl: ImageUrlBuilder.poster(movie.posterPath),
                fit: BoxFit.cover,
                placeholder: (context, url) => Container(
                  color: AppColors.surfaceVariant,
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
                errorWidget: (context, url, error) => Container(
                  color: AppColors.surfaceVariant,
                  child: const Icon(Icons.movie, size: 48),
                ),
              )
            : Container(
                color: AppColors.surfaceVariant,
                child: const Icon(Icons.movie, size: 48),
              ),
      ),
    );
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
