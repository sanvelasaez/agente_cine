import 'package:agente_cine/config/theme/app_dimensions.dart';
import 'package:agente_cine/presentation/screens/categories/providers/genres_provider.dart';
import 'package:agente_cine/presentation/shared/widgets/error_view.dart';
import 'package:agente_cine/presentation/shared/widgets/genre_chip.dart';
import 'package:agente_cine/presentation/shared/widgets/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

/// Categories page showing all movie genres
class CategoriesPage extends ConsumerWidget {
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final genresState = ref.watch(genresProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Categories')),
      body: genresState.when(
        data: (genres) {
          return RefreshIndicator(
            onRefresh: () async {
              ref.invalidate(genresProvider);
            },
            child: GridView.builder(
              padding: const EdgeInsets.all(AppDimensions.spacingM),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 3.5,
                crossAxisSpacing: AppDimensions.spacingM,
                mainAxisSpacing: AppDimensions.spacingM,
              ),
              itemCount: genres.length,
              itemBuilder: (context, index) {
                final genre = genres[index];
                return GenreChip(
                  genre: genre,
                  onTap: () {
                    context.go(
                      '/categories/${genre.id}?name=${Uri.encodeComponent(genre.name)}',
                    );
                  },
                );
              },
            ),
          );
        },
        loading: () => const LoadingIndicator(),
        error: (error, stack) => ErrorView(
          message: error.toString(),
          onRetry: () {
            ref.invalidate(genresProvider);
          },
        ),
      ),
    );
  }
}
