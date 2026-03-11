import 'package:agente_cine/config/theme/app_dimensions.dart';
import 'package:agente_cine/presentation/common/extensions/context_extensions.dart';
import 'package:flutter/material.dart';

/// Empty state view
class EmptyState extends StatelessWidget {
  const EmptyState({
    required this.message,
    this.icon = Icons.inbox,
    super.key,
  });

  final String message;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppDimensions.spacingL),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 64,
              color: context.colors.onSurface.withOpacity(0.3),
            ),
            const SizedBox(height: AppDimensions.spacingM),
            Text(
              message,
              style: context.textTheme.bodyLarge?.copyWith(
                color: context.colors.onSurface.withOpacity(0.6),
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
