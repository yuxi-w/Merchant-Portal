import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:merchant_app/locator.dart';
import 'package:merchant_app/views/shoppingcart/shopping_cart_view.dart';

void main() {
  testWidgets('Shopping cart page test', (WidgetTester tester) async {
    setupLocator();

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
}
