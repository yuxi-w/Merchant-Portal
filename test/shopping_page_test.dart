import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:merchant_app/datamodel/shoppingitem/ShoppingItem.dart';
import 'package:merchant_app/locator.dart';
import 'package:merchant_app/views/shoppingcart/shopping_cart_view.dart';
import 'package:merchant_app/widgets/shopping_cart_list_view/shopping_cart_list_item.dart';
import 'package:merchant_app/constants/constants/globals.dart' as globals;

void main() {
  setupLocator();
  testWidgets('Shopping cart page test', (WidgetTester tester) async {
    globals.isLoggedIn = true;
    await tester.pumpWidget(const MaterialApp(home: ShoppingCartView()));

    ///Test main title
    final mainTitle = find.byKey(const ValueKey("shoppingMainTitle"));
    expect(mainTitle, findsOneWidget);
    var text = mainTitle.evaluate().single.widget as Text;
    if (kDebugMode) {
      print(text.data);
    }

    ///Scroll the page
    final gesture = await tester
        .startGesture(Offset.zero /* THe position of your listview */);
    await gesture.moveBy(const Offset(0, -500));
    await tester.pump(); // flush the widget tree

    ///Test checkout button
    final checkOutButton = find.byKey(const ValueKey("checkOutButton"));
    expect(checkOutButton, findsOneWidget);
    await tester.tap(checkOutButton, warnIfMissed: false);
    await tester.pump();
    if (kDebugMode) {
      print('checkOut button works fine');
    }
  });

  testWidgets('Shopping cart items test', (WidgetTester tester) async {
    final ShoppingItem tempshoppingitem = ShoppingItem(
        "1",
        "name",
        "short description",
        "description description description description description description description description",
        "sample img",
        "price",
        "option",
        "category",
        "quantity");
    await tester
        .pumpWidget(MaterialApp(home: ShopCartListItem(tempshoppingitem)));

    ///Test title text and amount
    final title = find.byKey(const ValueKey("shoppingItemTitle"));
    expect(title, findsOneWidget);
    if (kDebugMode) {
      print('test title completed');
    }

    ///Test shopping item description
    final itemDescription =
        find.byKey(const ValueKey("shoppingItemDescription"));
    expect(itemDescription, findsOneWidget);
    if (kDebugMode) {
      print("description works fine");
    }

    ///Test shopping cancel button
    final cancelButton = find.byKey(const ValueKey("shoppingItemCancelButton"));
    expect(cancelButton, findsOneWidget);
    if (kDebugMode) {
      print('Cancel button works fine');
    }

    final productinfoButton =
        find.byKey(const ValueKey("shoppingItemProductInfoButton"));
    expect(productinfoButton, findsOneWidget);
    if (kDebugMode) {
      print('Product info button works fine');
    }
  });
}
