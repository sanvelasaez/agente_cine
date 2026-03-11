import 'package:agente_cine/config/theme/app_dimensions.dart';
import 'package:agente_cine/domain/entities/genre.dart';
import 'package:agente_cine/presentation/common/widgets/empty_state.dart';
import 'package:agente_cine/presentation/common/widgets/error_view.dart';
import 'package:agente_cine/presentation/common/widgets/loading_indicator.dart';
import 'package:agente_cine/presentation/common/widgets/movie_card.dart';
import 'package:agente_cine/presentation/features/categories/providers/category_movies_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Page showing movies filtered by genre
class CategoryMoviesPage extends ConsumerStatefulWidget {
  const CategoryMoviesPage({
    required this.genre,
    super.key,
  });

  final Genre genre;

  @override
  ConsumerState<CategoryMoviesPage> createState() => _CategoryMoviesPageState();
}

class _CategoryMoviesPageState extends ConsumerState<CategoryMoviesPage> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent * 0.9) {
      ref
          .read(categoryMoviesProvider(widget.genre.id).notifier)
          .loadMore();
    }
  }

  @override
  Widget build(BuildContext context) {
    final moviesState = ref.watch(categoryMoviesProvider(widget.genre.id));

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.genre.name),
      ),
      body: moviesState.when(
        data: (movies) {
          if (movies.isEmpty) {
            return const EmptyState(
              message: 'No movies found for this category',
              icon: Icons.movie_outlined,
            );
          }

          return RefreshIndicator(
            onRefresh: () async {
              ref
                  .read(categoryMoviesProvider(widget.genre.id).notifier)
                  .loadMovies();
            },
            child: GridView.builder(
              controller: _scrollController,
              padding: const EdgeInsets.all(AppDimensions.spacingM),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.6,
                crossAxisSpacing: AppDimensions.spacingM,
                mainAxisSpacing: AppDimensions.spacingM,
              ),
              itemCount: movies.length,
              itemBuilder: (context, index) {
                final movie = movies[index];
                return MovieCard(
                  movie: movie,
                  onTap: () {
                    // TODO: Navigate to movie detail
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
            ref
                .read(categoryMoviesProvider(widget.genre.id).notifier)
                .loadMovies();
          },
        ),
      ),
    );
  }
}
