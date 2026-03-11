import 'package:agente_cine/config/theme/app_colors.dart';
import 'package:agente_cine/config/theme/app_dimensions.dart';
import 'package:flutter/material.dart';

/// Star rating widget (displays rating out of 5 stars)
class RatingStars extends StatelessWidget {
  const RatingStars({
    required this.rating,
    this.size = AppDimensions.iconS,
    this.showValue = true,
    super.key,
  });

  final double rating; // 0-10 scale
  final double size;
  final bool showValue;

  @override
  Widget build(BuildContext context) {
    final ratingOutOfFive = rating / 2; // Convert 0-10 to 0-5

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        ...List.generate(5, (index) {
          final starValue = index + 1;
          return Icon(
            _getStarIcon(starValue, ratingOutOfFive),
            size: size,
            color: AppColors.secondary,
          );
        }),
        if (showValue) ...[
          const SizedBox(width: 4),
          Text(
            rating.toStringAsFixed(1),
            style: TextStyle(
              fontSize: size * 0.8,
              fontWeight: FontWeight.bold,
              color: _getRatingColor(rating),
            ),
          ),
        ],
      ],
    );
  }

  IconData _getStarIcon(int starValue, double rating) {
    if (rating >= starValue) {
      return Icons.star;
    } else if (rating >= starValue - 0.5) {
      return Icons.star_half;
    } else {
      return Icons.star_border;
    }
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
}
