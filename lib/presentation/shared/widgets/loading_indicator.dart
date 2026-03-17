import 'package:agente_cine/presentation/shared/extensions/context_extensions.dart';
import 'package:flutter/material.dart';

/// Custom loading indicator
class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({super.key, this.size = 40.0, this.message});

  final double size;
  final String? message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: size,
            height: size,
            child: CircularProgressIndicator(color: context.colors.primary),
          ),
          if (message != null) ...[
            const SizedBox(height: 16),
            Text(
              message!,
              style: context.textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
          ],
        ],
      ),
    );
  }
}
