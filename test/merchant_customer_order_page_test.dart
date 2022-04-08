import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:merchant_app/datamodel/shoppingitem/ShoppingItem.dart';
import 'package:merchant_app/locator.dart';
import 'package:merchant_app/views/order_history/order_history_list_item.dart';

void main() {
  testWidgets('Merchant Portal User Order History Item Page test',
      (WidgetTester tester) async {
    setupLocator();
    final ShoppingItem sitem = ShoppingItem(
        "1",
        "item",
        "shortDescriptionshortDescriptionshortDescriptionshortDescriptionshortDescription",
        "descriptionshortDescriptionshortDescriptionshortDescriptionshortDescriptionshortDescription",
        "picture",
        "1",
        "option",
        "category",
        "quantity");
    await tester.pumpWidget(MaterialApp(home: OrderHistoryListItem(sitem)));

    final title = find.byKey(const ValueKey("orderHistoryItemTitle"));
    expect(title, findsOneWidget);
    if (kDebugMode) {
      print('Order Title test completed');
    }

    final desc = find.byKey(const ValueKey("orderHistoryItemDescription"));
    expect(desc, findsOneWidget);
    if (kDebugMode) {
      print('Order description test completed');
    }
  });
}
