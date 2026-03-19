import 'dart:async';

import 'package:agente_cine/config/dependencies/injection.dart';
import 'package:agente_cine/config/theme/app_dimensions.dart';
import 'package:agente_cine/domain/actions/search_movies.dart';
import 'package:agente_cine/domain/entities/movie.dart';
import 'package:agente_cine/domain/errors/failure.dart';
import 'package:agente_cine/presentation/shared/widgets/empty_state.dart';
import 'package:agente_cine/presentation/shared/widgets/error_view.dart';
import 'package:agente_cine/presentation/shared/widgets/loading_indicator.dart';
import 'package:agente_cine/presentation/shared/widgets/movie_card.dart';
import 'package:flutter/material.dart';

/// Search page as a tab in the bottom navigation
class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _controller = TextEditingController();
  final SearchMovies _searchMovies = getIt<SearchMovies>();
  Timer? _debounce;
  List<Movie>? _results;
  bool _isLoading = false;
  String? _errorMessage;

  @override
  void dispose() {
    _controller.dispose();
    _debounce?.cancel();
    super.dispose();
  }

  void _onQueryChanged(String query) {
    _debounce?.cancel();

    if (query.trim().isEmpty) {
      setState(() {
        _results = null;
        _isLoading = false;
        _errorMessage = null;
      });
      return;
    }

    setState(() => _isLoading = true);

    _debounce = Timer(const Duration(milliseconds: 400), () async {
      final result = await _searchMovies(query: query);

      if (!mounted) {
        return;
      }

      result.fold(
        (failure) => setState(() {
          _errorMessage = failure.userMessage;
          _isLoading = false;
        }),
        (movies) => setState(() {
          _results = movies;
          _isLoading = false;
          _errorMessage = null;
        }),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Search')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(AppDimensions.spacingM),
            child: TextField(
              controller: _controller,
              onChanged: _onQueryChanged,
              decoration: InputDecoration(
                hintText: 'Search movies...',
                prefixIcon: const Icon(Icons.search),
                suffixIcon: _controller.text.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () {
                          _controller.clear();
                          _onQueryChanged('');
                        },
                      )
                    : null,
                border: OutlineInputBorder(
                  borderRadius:
                      BorderRadius.circular(AppDimensions.radiusXl),
                ),
              ),
            ),
          ),
          Expanded(child: _buildBody()),
        ],
      ),
    );
  }

  Widget _buildBody() {
    if (_isLoading) {
      return const LoadingIndicator();
    }

    if (_errorMessage != null) {
      return ErrorView(
        message: _errorMessage!,
        onRetry: () => _onQueryChanged(_controller.text),
      );
    }

    if (_results == null) {
      return const EmptyState(
        message: 'Enter a movie title to search',
        icon: Icons.search,
      );
    }

    if (_results!.isEmpty) {
      return const EmptyState(
        message: 'No movies found',
        icon: Icons.movie_outlined,
      );
    }

    return GridView.builder(
      padding: const EdgeInsets.all(AppDimensions.spacingM),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.6,
        crossAxisSpacing: AppDimensions.spacingM,
        mainAxisSpacing: AppDimensions.spacingM,
      ),
      itemCount: _results!.length,
      itemBuilder: (context, index) {
        return MovieCard(movie: _results![index]);
      },
    );
  }
}
