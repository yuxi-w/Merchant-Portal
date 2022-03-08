import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:merchant_app/locator.dart';
import 'package:merchant_app/routing/route_names.dart';
import 'package:merchant_app/widgets/navigation_bar/navbar_item.dart';

void main() {
  testWidgets('Navigation bar items test', (WidgetTester tester) async {
    setupLocator();

    await tester
        .pumpWidget(const MaterialApp(home: NavBarItem("test", HomeRoute)));

    ///Test item clickable
    final item = find.byKey(const ValueKey("navBarItem"));
    expect(item, findsOneWidget);
    await tester.tap(item);
    await tester.pump();
    if (kDebugMode) {
      print('item button works fine');
    }
  });
}
