import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:merchant_app/locator.dart';
import 'package:merchant_app/widgets/category_page_list_view/category_page_list_item.dart';

void main() {
  testWidgets('Category page items test', (WidgetTester tester) async {
    setupLocator();

    await tester.pumpWidget(const MaterialApp(
        home: CategoryPageListItem(
            "test1", "\$10", "test description", "assets/clothes.jpeg")));

    ///Test title text
    final title = find.byKey(const ValueKey("categoryItemTitle"));
    expect(title, findsOneWidget);
    expect(find.text('test1'), findsOneWidget);
    if (kDebugMode) {
      print("Title test completed");
    }

    ///Test description text
    final description = find.byKey(const ValueKey("categoryItemDescription"));
    expect(description, findsOneWidget);
    expect(find.text('test description'), findsOneWidget);
    var text2 = description.evaluate().single.widget as Text;
    if (kDebugMode) {
      print(text2.data);
    }

    ///Click on category item
    final itemCard = find.byKey(const ValueKey("categoryMainCard"));
    expect(itemCard, findsOneWidget);
    await tester.tap(itemCard);
    await tester.pump();
    if (kDebugMode) {
      print('click on category item works fine');
    }
  });
}
