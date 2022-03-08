import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:merchant_app/locator.dart';
import 'package:merchant_app/widgets/home_page_list_view/home_page_list_item.dart';

void main() {
  testWidgets('Home page items test', (WidgetTester tester) async {
    setupLocator();

    await tester.pumpWidget(const MaterialApp(
        home: HomePageListItem(
            "Product1", "100", "description", "assets/electronics.png")));

    ///Test title text
    final title = find.byKey(const ValueKey("title"));
    expect(title, findsOneWidget);
    expect(find.text('Product1'), findsOneWidget);
    if (kDebugMode) {
      print('test title completed');
    }

    ///Test description text
    final description = find.byKey(const ValueKey("description"));
    expect(description, findsOneWidget);
    expect(find.text('description'), findsOneWidget);
    if (kDebugMode) {
      print('test description completed');
    }

    ///Test more info button
    final moreInfoButton = find.byKey(const ValueKey("HomeMoreInfoButton"));
    expect(moreInfoButton, findsOneWidget);
    await tester.tap(moreInfoButton);
    await tester.pump();
    if (kDebugMode) {
      print('more info button works fine');
    }
  });
}
