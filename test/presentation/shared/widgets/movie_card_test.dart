import 'package:agente_cine/domain/entities/movie.dart';
import 'package:agente_cine/presentation/shared/widgets/movie_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

Movie _createMovie({
  int id = 1,
  String title = 'Test Movie',
  double voteAverage = 7.5,
  String? posterPath,
}) {
  return Movie(
    id: id,
    title: title,
    overview: 'A test movie overview',
    voteAverage: voteAverage,
    voteCount: 100,
    posterPath: posterPath,
  );
}

Widget _buildTestWidget(Movie movie, {VoidCallback? onTap}) {
  return MaterialApp(
    home: Scaffold(
      body: SizedBox(
        width: 200,
        height: 300,
        child: MovieCard(movie: movie, onTap: onTap ?? () {}),
      ),
    ),
  );
}

void main() {
  group('MovieCard Widget', () {
    testWidgets('should display movie title', (tester) async {
      final movie = _createMovie(title: 'Inception');

      await tester.pumpWidget(_buildTestWidget(movie));

      expect(find.text('Inception'), findsOneWidget);
    });

    testWidgets('should display rating circle with vote average',
        (tester) async {
      final movie = _createMovie(voteAverage: 8.5);

      await tester.pumpWidget(_buildTestWidget(movie));

      // Rating circle shows the vote average text
      expect(find.text('8.5'), findsOneWidget);
    });

    testWidgets('should display CircularProgressIndicator for rating',
        (tester) async {
      final movie = _createMovie(voteAverage: 7.0);

      await tester.pumpWidget(_buildTestWidget(movie));

      // The rating circle uses a CircularProgressIndicator
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('should NOT display star icons (replaced by rating circle)',
        (tester) async {
      final movie = _createMovie(voteAverage: 8.0);

      await tester.pumpWidget(_buildTestWidget(movie));

      // Stars should no longer be in MovieCard
      expect(find.byIcon(Icons.star), findsNothing);
      expect(find.byIcon(Icons.star_half), findsNothing);
      expect(find.byIcon(Icons.star_border), findsNothing);
    });

    testWidgets('should show rating value formatted to one decimal',
        (tester) async {
      final movie = _createMovie(voteAverage: 6.789);

      await tester.pumpWidget(_buildTestWidget(movie));

      expect(find.text('6.8'), findsOneWidget);
    });

    testWidgets('should show placeholder icon when posterPath is null',
        (tester) async {
      final movie = _createMovie(posterPath: null);

      await tester.pumpWidget(_buildTestWidget(movie));

      expect(find.byIcon(Icons.movie), findsOneWidget);
    });

    testWidgets('should invoke onTap callback when tapped', (tester) async {
      var tapped = false;
      final movie = _createMovie();

      await tester.pumpWidget(
        _buildTestWidget(movie, onTap: () => tapped = true),
      );

      await tester.tap(find.byType(MovieCard));
      expect(tapped, isTrue);
    });

    testWidgets('should render rating circle container with circle shape',
        (tester) async {
      final movie = _createMovie(voteAverage: 9.0);

      await tester.pumpWidget(_buildTestWidget(movie));

      // Find the Container that has BoxShape.circle decoration
      final containers = tester
          .widgetList<Container>(find.byType(Container))
          .where((c) {
        final decoration = c.decoration;
        if (decoration is BoxDecoration) {
          return decoration.shape == BoxShape.circle;
        }
        return false;
      });

      expect(containers.isNotEmpty, isTrue);
    });

    testWidgets('should handle zero rating', (tester) async {
      final movie = _createMovie(voteAverage: 0.0);

      await tester.pumpWidget(_buildTestWidget(movie));

      expect(find.text('0.0'), findsOneWidget);
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('should handle perfect 10 rating', (tester) async {
      final movie = _createMovie(voteAverage: 10.0);

      await tester.pumpWidget(_buildTestWidget(movie));

      expect(find.text('10.0'), findsOneWidget);
    });
  });
}
