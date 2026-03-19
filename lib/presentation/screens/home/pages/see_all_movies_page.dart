import 'package:agente_cine/config/theme/app_dimensions.dart';
import 'package:agente_cine/presentation/screens/home/models/movie_category.dart';
import 'package:agente_cine/presentation/screens/home/providers/see_all_movies_provider.dart';
import 'package:agente_cine/presentation/shared/widgets/empty_state.dart';
import 'package:agente_cine/presentation/shared/widgets/error_view.dart';
import 'package:agente_cine/presentation/shared/widgets/loading_indicator.dart';
import 'package:agente_cine/presentation/shared/widgets/movie_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

/// Page showing all movies for a given home category in a grid
class SeeAllMoviesPage extends ConsumerStatefulWidget {
  const SeeAllMoviesPage({required this.category, super.key});

  final MovieCategory category;

  @override
  ConsumerState<SeeAllMoviesPage> createState() => _SeeAllMoviesPageState();
}

class _SeeAllMoviesPageState extends ConsumerState<SeeAllMoviesPage> {
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
          .read(seeAllMoviesProvider(widget.category).notifier)
          .loadMore();
    }
  }

  @override
  Widget build(BuildContext context) {
    final moviesState = ref.watch(seeAllMoviesProvider(widget.category));

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
        title: Text(widget.category.title),
      ),
      body: moviesState.when(
        data: (movies) {
          if (movies.isEmpty) {
            return const EmptyState(
              message: 'No movies found',
              icon: Icons.movie_outlined,
            );
          }

          return RefreshIndicator(
            onRefresh: () => ref
                .read(seeAllMoviesProvider(widget.category).notifier)
                .loadMovies(),
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
                return MovieCard(movie: movie);
              },
            ),
          );
        },
        loading: () => const LoadingIndicator(),
        error: (error, stack) => ErrorView(
          message: error.toString(),
          onRetry: () {
            ref
                .read(seeAllMoviesProvider(widget.category).notifier)
                .loadMovies();
          },
        ),
      ),
    );
  }
}
