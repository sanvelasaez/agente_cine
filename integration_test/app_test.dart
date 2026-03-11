import 'package:agente_cine/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('AgenteCine App Integration Tests', () {
    testWidgets('app should launch successfully', (tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(const App());
      await tester.pumpAndSettle();

      // Verify that the app launches
      expect(find.byType(MaterialApp), findsOneWidget);
    });
  });
}
