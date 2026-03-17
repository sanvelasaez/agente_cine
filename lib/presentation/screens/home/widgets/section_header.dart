import 'package:agente_cine/config/theme/app_dimensions.dart';
import 'package:agente_cine/config/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

/// Section header widget with title and optional "See all" button
class SectionHeader extends StatelessWidget {
  const SectionHeader({required this.title, this.onSeeAllTap, super.key});

  final String title;
  final VoidCallback? onSeeAllTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimensions.spacingM,
        vertical: AppDimensions.spacingS,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: AppTextStyles.sectionHeader),
          if (onSeeAllTap != null)
            TextButton(onPressed: onSeeAllTap, child: const Text('See all')),
        ],
      ),
    );
  }
}
