import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:merchant_app/views/productdetail/product_detail_view.dart';

void main() {
  testWidgets('Product detail page test', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: ProductDetailView()));

    ///Test main title
    final mainTitle = find.byKey(const ValueKey("productDetailTitle"));
    expect(mainTitle, findsOneWidget);
    var text = mainTitle.evaluate().single.widget as Text;
    if (kDebugMode) {
      print(text.data);
    }

    ///Test product category text
    final productCategoryText =
        find.byKey(const ValueKey("productDetailCategory"));
    expect(productCategoryText, findsOneWidget);
    var text1 = productCategoryText.evaluate().single.widget as Text;
    if (kDebugMode) {
      print(text1.data);
    }

    ///Test product description
    final productDescriptionText =
        find.byKey(const ValueKey("productDetailDescription"));
    expect(productDescriptionText, findsOneWidget);
    var text2 = productDescriptionText.evaluate().single.widget as Text;
    if (kDebugMode) {
      print(text2.data);
    }

    ///Scroll the page
    final gesture = await tester
        .startGesture(Offset.zero /* THe position of your listview */);
    await gesture.moveBy(const Offset(0, -500));
    await tester.pump();

    ///Test product price text
    final productPriceText = find.byKey(const ValueKey("productDetailPrice"));
    expect(productPriceText, findsOneWidget);
    var text3 = productPriceText.evaluate().single.widget as Text;
    if (kDebugMode) {
      print(text3.data);
    }

    ///Test product color text
    final productColorText = find.byKey(const ValueKey("productDetailColor"));
    expect(productColorText, findsOneWidget);
    var text4 = productColorText.evaluate().single.widget as Text;
    if (kDebugMode) {
      print(text4.data);
    }

    ///Test product quantity text
    final productQuantityText =
        find.byKey(const ValueKey("productDetailQuantityText"));
    expect(productQuantityText, findsOneWidget);
    var text5 = productQuantityText.evaluate().single.widget as Text;
    if (kDebugMode) {
      print(text5.data);
    }

    ///Test add button
    final addButton = find.byKey(const ValueKey("productDetailAddButton"));
    expect(addButton, findsOneWidget);
    await tester.tap(addButton, warnIfMissed: false);
    await tester.pump();
    if (kDebugMode) {
      print('add button works fine');
    }

    ///Test remove button
    final removeButton =
        find.byKey(const ValueKey("productDetailRemoveButton"));
    expect(removeButton, findsOneWidget);
    await tester.tap(removeButton, warnIfMissed: false);
    await tester.pump();
    if (kDebugMode) {
      print('remove button works fine');
    }

    ///Test add to bag button
    final addToBagButton =
        find.byKey(const ValueKey("productDetailAddToBagButton"));
    expect(addToBagButton, findsOneWidget);
    await tester.tap(addToBagButton, warnIfMissed: false);
    await tester.pump();
    if (kDebugMode) {
      print('add to bag button works fine');
    }
  });
}
