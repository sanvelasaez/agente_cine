import 'package:agente_cine/presentation/shared/widgets/rating_stars.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Widget createWidgetUnderTest({
    required double rating,
    double size = 16,
    bool showValue = true,
  }) {
    return MaterialApp(
      home: Scaffold(
        body: RatingStars(rating: rating, size: size, showValue: showValue),
      ),
    );
  }

  group('RatingStars Widget', () {
    testWidgets('should display 5 stars', (tester) async {
      // Arrange & Act
      await tester.pumpWidget(createWidgetUnderTest(rating: 8));

      // Assert
      expect(find.byIcon(Icons.star), findsWidgets);
      expect(find.byIcon(Icons.star_border), findsWidgets);
    });

    testWidgets('should display rating value when showValue is true', (
      tester,
    ) async {
      // Arrange & Act
      await tester.pumpWidget(createWidgetUnderTest(rating: 8.5));

      // Assert
      expect(find.text('8.5'), findsOneWidget);
    });

    testWidgets('should not display rating value when showValue is false', (
      tester,
    ) async {
      // Arrange & Act
      await tester.pumpWidget(
        createWidgetUnderTest(rating: 8.5, showValue: false),
      );

      // Assert
      expect(find.text('8.5'), findsNothing);
    });

    testWidgets('should display full stars for high rating', (tester) async {
      // Arrange & Act
      await tester.pumpWidget(createWidgetUnderTest(rating: 10));

      // Assert
      expect(find.byIcon(Icons.star), findsNWidgets(5));
      expect(find.byIcon(Icons.star_border), findsNothing);
    });

    testWidgets('should display empty stars for zero rating', (tester) async {
      // Arrange & Act
      await tester.pumpWidget(createWidgetUnderTest(rating: 0));

      // Assert
      expect(find.byIcon(Icons.star_border), findsNWidgets(5));
      expect(find.byIcon(Icons.star), findsNothing);
    });

    testWidgets('should display half star for decimal rating', (tester) async {
      // Arrange & Act
      await tester.pumpWidget(createWidgetUnderTest(rating: 5));

      // Assert - 5.0 / 2 = 2.5 stars, so 2 full + 1 half + 2 empty
      expect(find.byIcon(Icons.star), findsNWidgets(2));
      expect(find.byIcon(Icons.star_half), findsOneWidget);
      expect(find.byIcon(Icons.star_border), findsNWidgets(2));
    });

    testWidgets('should handle custom size', (tester) async {
      // Arrange & Act
      await tester.pumpWidget(createWidgetUnderTest(rating: 8, size: 24));

      // Assert
      final icon = tester.widget<Icon>(find.byIcon(Icons.star).first);
      expect(icon.size, 24);
    });
  });
}
