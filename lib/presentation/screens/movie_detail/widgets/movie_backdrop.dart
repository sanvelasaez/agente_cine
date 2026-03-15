import 'package:agente_cine/config/theme/app_colors.dart';
import 'package:agente_cine/core/utils/image_url_builder.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

/// Movie backdrop image widget
class MovieBackdrop extends StatelessWidget {
  const MovieBackdrop({
    required this.backdropPath,
    super.key,
  });

  final String? backdropPath;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final height = screenWidth * 0.6;

    return SizedBox(
      height: height,
      width: double.infinity,
      child: Stack(
        fit: StackFit.expand,
        children: [
          if (backdropPath != null)
            CachedNetworkImage(
              imageUrl: ImageUrlBuilder.backdrop(backdropPath),
              fit: BoxFit.cover,
              placeholder: (context, url) => const ColoredBox(
                color: AppColors.surfaceVariant,
                child: Center(child: CircularProgressIndicator()),
              ),
              errorWidget: (context, url, error) => const ColoredBox(
                color: AppColors.surfaceVariant,
                child: Icon(Icons.movie, size: 64),
              ),
            )
          else
            const ColoredBox(
              color: AppColors.surfaceVariant,
              child: Icon(Icons.movie, size: 64),
            ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.black.withValues(alpha: 0.7),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
