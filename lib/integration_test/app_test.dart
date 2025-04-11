import 'package:flutter_test/flutter_test.dart';
import 'package:how_to/main.dart';
import 'package:integration_test/integration_test.dart';
import 'package:it_passport_training_app/main.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('end-to-end test', () {
    testWidgets('tap on the floating action button, verify counter', (tester) async {
      // Load app widget.
      await tester.pumpWidget(const MyApp());

      // Verify the counter increments by 1.
      expect(find.text('1'), findsOneWidget);
    });
  });
}
