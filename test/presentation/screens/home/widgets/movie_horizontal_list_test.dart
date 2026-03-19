import 'package:agente_cine/domain/entities/movie.dart';
import 'package:agente_cine/presentation/screens/home/bloc/home_bloc.dart';
import 'package:agente_cine/presentation/screens/home/widgets/movie_horizontal_list.dart';
import 'package:agente_cine/presentation/shared/widgets/empty_state.dart';
import 'package:agente_cine/presentation/shared/widgets/error_view.dart';
import 'package:agente_cine/presentation/shared/widgets/loading_indicator.dart';
import 'package:agente_cine/presentation/shared/widgets/movie_card.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

List<Movie> _createMovies(int count) {
  return List.generate(
    count,
    (i) => Movie(
      id: i + 1,
      title: 'Movie ${i + 1}',
      overview: 'Overview ${i + 1}',
      voteAverage: 7.0 + i * 0.5,
      voteCount: 100 + i,
    ),
  );
}

Widget _buildTestWidget({
  required AsyncValue<List<Movie>> asyncValue,
  VoidCallback? onRetry,
}) {
  return MaterialApp(
    home: Scaffold(
      body: MovieHorizontalList(
        asyncValue: asyncValue,
        onRetry: onRetry,
      ),
    ),
  );
}

void main() {
  group('MovieHorizontalList Widget', () {
    testWidgets('should show LoadingIndicator when loading', (tester) async {
      await tester.pumpWidget(
        _buildTestWidget(
          asyncValue: const AsyncValue<List<Movie>>.loading(),
        ),
      );

      expect(find.byType(LoadingIndicator), findsOneWidget);
    });

    testWidgets('should show ErrorView when error with retry', (tester) async {
      var retried = false;

      await tester.pumpWidget(
        _buildTestWidget(
          asyncValue: const AsyncValue<List<Movie>>.error('Network error'),
          onRetry: () => retried = true,
        ),
      );

      expect(find.byType(ErrorView), findsOneWidget);

      await tester.tap(find.text('Retry'));
      expect(retried, isTrue);
    });

    testWidgets('should show EmptyState when data is empty list',
        (tester) async {
      await tester.pumpWidget(
        _buildTestWidget(
          asyncValue: const AsyncValue<List<Movie>>.data([]),
        ),
      );

      expect(find.byType(EmptyState), findsOneWidget);
    });

    testWidgets('should render MovieCards with FadeInRight animation',
        (tester) async {
      final movies = _createMovies(3);

      await tester.pumpWidget(
        _buildTestWidget(
          asyncValue: AsyncValue<List<Movie>>.data(movies),
        ),
      );
      await tester.pumpAndSettle();

      // Each movie card is wrapped in FadeInRight
      expect(find.byType(FadeInRight), findsNWidgets(3));
      expect(find.byType(MovieCard), findsNWidgets(3));
    });

    testWidgets('should render movie titles in MovieCards', (tester) async {
      final movies = _createMovies(2);

      await tester.pumpWidget(
        _buildTestWidget(
          asyncValue: AsyncValue<List<Movie>>.data(movies),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Movie 1'), findsOneWidget);
      expect(find.text('Movie 2'), findsOneWidget);
    });

    testWidgets('should render without errors when animations complete',
        (tester) async {
      final movies = _createMovies(5);

      await tester.pumpWidget(
        _buildTestWidget(
          asyncValue: AsyncValue<List<Movie>>.data(movies),
        ),
      );

      // Pump through all animation frames
      await tester.pumpAndSettle();

      // No errors should have occurred
      expect(find.byType(MovieHorizontalList), findsOneWidget);
    });

    testWidgets('should show error text when no retry callback provided',
        (tester) async {
      await tester.pumpWidget(
        _buildTestWidget(
          asyncValue: const AsyncValue<List<Movie>>.error('Some error'),
        ),
      );

      expect(find.text('Some error'), findsOneWidget);
    });
  });
}
