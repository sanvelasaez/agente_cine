import 'package:agente_cine/config/theme/app_dimensions.dart';
import 'package:agente_cine/domain/entities/genre.dart';
import 'package:agente_cine/presentation/shared/extensions/context_extensions.dart';
import 'package:agente_cine/presentation/shared/widgets/genre_chip.dart';
import 'package:flutter/material.dart';

/// Movie genres section
class MovieGenresSection extends StatelessWidget {
  const MovieGenresSection({
    required this.genres,
    super.key,
  });

  final List<Genre>? genres;

  @override
  Widget build(BuildContext context) {
    if (genres == null || genres!.isEmpty) {
      return const SizedBox.shrink();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Genres',
          style: context.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: AppDimensions.spacingS),
        Wrap(
          spacing: AppDimensions.spacingS,
          runSpacing: AppDimensions.spacingS,
          children: genres!.map((genre) => GenreChip(genre: genre)).toList(),
        ),
      ],
    );
  }
}
