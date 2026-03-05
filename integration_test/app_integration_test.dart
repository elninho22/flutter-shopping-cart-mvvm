import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:test_outforce_app/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('end-to-end test', () {
    testWidgets('Fluxo completo: catálogo -> carrinho -> confirmação de pedido',
        (tester) async {
      app.main();
      await tester.pumpAndSettle();
      expect(find.text('Catálogo'), findsOneWidget);

      await tester.pumpAndSettle(const Duration(seconds: 2));

      final addButton = find.byIcon(Icons.add_shopping_cart).first;
      await tester.tap(addButton);
      await tester.pumpAndSettle();


      final cartBadge = find.descendant(
        of: find.widgetWithIcon(IconButton, Icons.shopping_cart),
        matching: find.text('1'),
      );
      expect(cartBadge, findsOneWidget);


      final cartButton = find.widgetWithIcon(IconButton, Icons.shopping_cart).first;
      await tester.tap(cartButton);
      await tester.pumpAndSettle();

      expect(find.textContaining('Finalizar Pedido'), findsOneWidget);

      final finalizeButton = find.text('Finalizar Pedido');
      await tester.tap(finalizeButton);
      await tester.pumpAndSettle();
      await tester.pumpAndSettle(const Duration(seconds: 1));
    });
  });
}