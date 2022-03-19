import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:merchant_app/datamodel/shoppingitem/ShoppingItem.dart';
import 'package:merchant_app/locator.dart';
import 'package:merchant_app/widgets/home_page_list_view/home_page_list_item.dart';

void main() {
  testWidgets('Home page items test', (WidgetTester tester) async {
    setupLocator();
    final ShoppingItem tempshoppingitem = ShoppingItem(
        1,
        "name",
        "short description",
        "description",
        "sample img",
        "price",
        "option",
        "category",
        "quantity");
    await tester
        .pumpWidget(MaterialApp(home: HomePageListItem(tempshoppingitem)));

    ///Test title text
    final title = find.byKey(const ValueKey("title"));
    expect(title, findsOneWidget);
    expect(find.text('name'), findsOneWidget);
    if (kDebugMode) {
      print('test title completed');
    }

    ///Test description text
    final description = find.byKey(const ValueKey("description"));
    expect(description, findsOneWidget);
    expect(find.text('short description'), findsOneWidget);
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
