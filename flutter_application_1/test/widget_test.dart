import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_application_1/main.dart';

void main() {
  testWidgets('FreshCart home screen renders', (tester) async {
    await tester.pumpWidget(const FreshCartApp());
    await tester.pump();

    expect(find.text('Shop by category'), findsOneWidget);
    expect(find.text('Fresh Vegetables'), findsOneWidget);
  });
}
