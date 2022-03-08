import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:merchant_app/locator.dart';
import 'package:merchant_app/views/shoppingcart/shopping_cart_view.dart';
import 'package:merchant_app/widgets/shopping_cart_list_view/shopping_cart_list_item.dart';

void main() {
  setupLocator();
  testWidgets('Shopping cart page test', (WidgetTester tester) async {
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

    ///Test total amount text
    final totalAmountText = find.byKey(const ValueKey("totalAmountText"));
    expect(totalAmountText, findsOneWidget);
    var text1 = totalAmountText.evaluate().single.widget as Text;
    if (kDebugMode) {
      print(text1.data);
    }

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
    await tester.pumpWidget(const MaterialApp(
        home: ShopCartListItem(
            "Product1", "100", "description", 1, "assets/electronics.png")));

    ///Test title text
    final title = find.byKey(const ValueKey("shoppingItemTitle"));
    expect(title, findsOneWidget);
    expect(find.text('Product1'), findsOneWidget);
    if (kDebugMode) {
      print('test title completed');
    }

    ///Test shopping item description
    final itemDescription =
        find.byKey(const ValueKey("shoppingItemDescription"));
    expect(itemDescription, findsOneWidget);
    var text = itemDescription.evaluate().single.widget as Text;
    if (kDebugMode) {
      print(text.data);
    }

    ///Test shopping item amount
    final itemAmount = find.byKey(const ValueKey("shoppingItemAmount"));
    expect(itemAmount, findsOneWidget);
    var text1 = itemAmount.evaluate().single.widget as Text;
    if (kDebugMode) {
      print(text1.data);
    }

    ///Test shopping add button
    final addButton = find.byKey(const ValueKey("shoppingItemAddButton"));
    expect(addButton, findsOneWidget);
    await tester.tap(addButton, warnIfMissed: false);
    await tester.pump();
    if (kDebugMode) {
      print('Add button works fine');
    }

    ///Test shopping remove button
    final removeButton = find.byKey(const ValueKey("shoppingItemRemoveButton"));
    expect(removeButton, findsOneWidget);
    await tester.tap(removeButton, warnIfMissed: false);
    await tester.pump();
    if (kDebugMode) {
      print('Remove button works fine');
    }

    ///Test shopping cancel button
    final cancelButton = find.byKey(const ValueKey("shoppingItemCancelButton"));
    expect(cancelButton, findsOneWidget);
    await tester.tap(cancelButton, warnIfMissed: false);
    await tester.pump();
    if (kDebugMode) {
      print('Cancel button works fine');
    }
  });
}
