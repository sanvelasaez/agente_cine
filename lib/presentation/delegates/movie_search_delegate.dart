import 'dart:async';

import 'package:agente_cine/config/di/injection.dart';
import 'package:agente_cine/config/theme/app_dimensions.dart';
import 'package:agente_cine/domain/entities/movie.dart';
import 'package:agente_cine/domain/usecases/search_movies.dart';
import 'package:agente_cine/presentation/common/widgets/empty_state.dart';
import 'package:agente_cine/presentation/common/widgets/error_view.dart';
import 'package:agente_cine/presentation/common/widgets/loading_indicator.dart';
import 'package:agente_cine/presentation/common/widgets/movie_card.dart';
import 'package:flutter/material.dart';

/// Search delegate for searching movies
class MovieSearchDelegate extends SearchDelegate<Movie?> {
  MovieSearchDelegate() : _searchMovies = getIt<SearchMovies>();

  final SearchMovies _searchMovies;
  Timer? _debounce;
  List<Movie>? _lastResults;
  String _lastQuery = '';

  @override
  String get searchFieldLabel => 'Search movies...';

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      if (query.isNotEmpty)
        IconButton(
          icon: const Icon(Icons.clear),
          onPressed: () {
            query = '';
            _lastResults = null;
            _lastQuery = '';
          },
        ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () => close(context, null),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return _buildSearchResults(context);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return _buildSearchResults(context);
  }

  Widget _buildSearchResults(BuildContext context) {
    if (query.trim().isEmpty) {
      return const EmptyState(
        message: 'Enter a movie title to search',
        icon: Icons.search,
      );
    }

    if (query == _lastQuery && _lastResults != null) {
      return _buildMovieGrid(_lastResults!);
    }

    return FutureBuilder<List<Movie>>(
      future: _debouncedSearch(query),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const LoadingIndicator();
        }

        if (snapshot.hasError) {
          return ErrorView(
            message: 'Error searching movies',
            onRetry: () => _debouncedSearch(query),
          );
        }

        final movies = snapshot.data ?? [];

        if (movies.isEmpty) {
          return const EmptyState(
            message: 'No movies found',
            icon: Icons.movie_outlined,
          );
        }

        _lastResults = movies;
        _lastQuery = query;

        return _buildMovieGrid(movies);
      },
    );
  }

  Widget _buildMovieGrid(List<Movie> movies) {
    return GridView.builder(
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
          onTap: () => close(context, movie),
        );
      },
    );
  }

  Future<List<Movie>> _debouncedSearch(String searchQuery) async {
    if (_debounce?.isActive ?? false) {
      _debounce!.cancel();
    }

    final completer = Completer<List<Movie>>();

    _debounce = Timer(const Duration(milliseconds: 300), () async {
      final result = await _searchMovies(query: searchQuery);

      result.fold(
        completer.completeError,
        completer.complete,
      );
    });

    return completer.future;
  }

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }
}
