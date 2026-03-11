import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:agente_cine/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('AgenteCine App Integration Tests', () {
    testWidgets('app should launch successfully', (tester) async {
      // Launch the app
      app.main();
      await tester.pumpAndSettle();

      // Verify app launches without crash
      expect(find.byType(app.AgenteCineApp), findsOneWidget);
    });
  });
}
