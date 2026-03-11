import 'package:agente_cine/config/theme/app_dimensions.dart';
import 'package:agente_cine/presentation/common/extensions/context_extensions.dart';
import 'package:flutter/material.dart';

/// Movie overview/synopsis section
class MovieOverviewSection extends StatelessWidget {
  const MovieOverviewSection({
    required this.overview,
    super.key,
  });

  final String overview;

  @override
  Widget build(BuildContext context) {
    if (overview.isEmpty) {
      return const SizedBox.shrink();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Overview',
          style: context.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: AppDimensions.spacingS),
        Text(
          overview,
          style: context.textTheme.bodyMedium?.copyWith(
            height: 1.5,
          ),
        ),
      ],
    );
  }
}
