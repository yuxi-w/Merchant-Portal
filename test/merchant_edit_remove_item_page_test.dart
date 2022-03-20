import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:merchant_app/datamodel/shoppingitem/ShoppingItem.dart';
import 'package:merchant_app/locator.dart';
import 'package:merchant_app/views/merchantportal/add_item/add_item.dart';
import 'package:merchant_app/views/merchantportal/remove_item/remove_item_list_items.dart';

void main() {
  testWidgets('Merchant Portal Edit/Remove Item Page test',
      (WidgetTester tester) async {
    setupLocator();
    final ShoppingItem sitem = ShoppingItem(
        1,
        "item",
        "shortDescriptionshortDescriptionshortDescriptionshortDescriptionshortDescription",
        "descriptionshortDescriptionshortDescriptionshortDescriptionshortDescriptionshortDescription",
        "picture",
        "1",
        "option",
        "category",
        "quantity");
    await tester.pumpWidget(MaterialApp(
        home: RemoveItemListItems(shoppingItem: sitem, height: 10, width: 10)));

    final img = find.byKey(const ValueKey("remove_item_img"));
    expect(img, findsOneWidget);
    if (kDebugMode) {
      print('Item image test completed');
    }

    final desc = find.byKey(const ValueKey("remove_item_description"));
    expect(desc, findsOneWidget);
    if (kDebugMode) {
      print('Item description test completed');
    }

    expect(find.text("Remove Item"), findsOneWidget);
    if (kDebugMode) {
      print("Remove item button found");
    }

    expect(find.text("Edit Item"), findsOneWidget);
    if (kDebugMode) {
      print("Edit Item button found");
    }
  });
}
