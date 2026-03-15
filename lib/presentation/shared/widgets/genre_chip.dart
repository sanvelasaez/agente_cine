import 'package:agente_cine/config/theme/app_dimensions.dart';
import 'package:agente_cine/domain/entities/genre.dart';
import 'package:agente_cine/presentation/shared/extensions/context_extensions.dart';
import 'package:flutter/material.dart';

/// Genre chip widget
class GenreChip extends StatelessWidget {
  const GenreChip({
    required this.genre,
    this.onTap,
    super.key,
  });

  final Genre genre;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Chip(
        label: Text(genre.name),
        labelStyle: context.textTheme.labelSmall,
        padding: const EdgeInsets.symmetric(
          horizontal: AppDimensions.spacingS,
          vertical: AppDimensions.spacingXs,
        ),
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
    );
  }
}
