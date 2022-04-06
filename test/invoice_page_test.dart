import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:merchant_app/datamodel/shoppingitem/ShoppingItem.dart';
import 'package:merchant_app/locator.dart';
import 'package:merchant_app/views/invoice/invoice_content_desktop.dart';
import 'package:merchant_app/views/invoice/invoice_view.dart';

void main() {
  testWidgets('Invoice page test', (WidgetTester tester) async {
    setupLocator();
    List<ShoppingItem> userShoppingBag = [
      ShoppingItem("1", "item", "shortDescription", "description", "picture",
          "1", "option", "category", "quantity")
    ];

    await tester.pumpWidget(
        MaterialApp(home: InvoiceView(userShoppingBag: userShoppingBag)));

    ///Test main text
    final invoiceMainTitle = find.byKey(const ValueKey("invoiceMainTitle"));
    expect(invoiceMainTitle, findsOneWidget);
    var text = invoiceMainTitle.evaluate().single.widget as Text;
    if (kDebugMode) {
      print(text.data);
    }

    ///Test order placed text
    final invoiceOrderPlacedText =
        find.byKey(const ValueKey("invoice_page_order_placed"));
    expect(invoiceOrderPlacedText, findsOneWidget);
    var text1 = invoiceOrderPlacedText.evaluate().single.widget as Text;
    if (kDebugMode) {
      print(text1.data);
    }
  });

  testWidgets('Invoice Content test', (WidgetTester tester) async {
    List<ShoppingItem> userShoppingBag = [
      ShoppingItem("1", "item", "shortDescription", "description", "picture",
          "1", "option", "category", "quantity")
    ];
    await tester.pumpWidget(
        MaterialApp(home: InvoiceContent(userShoppingBag: userShoppingBag)));

    ///Test sub total text
    final invoiceSubTotalText =
        find.byKey(const ValueKey("invoice_sub_total_text"));
    expect(invoiceSubTotalText, findsOneWidget);
    var text = invoiceSubTotalText.evaluate().single.widget as Text;
    if (kDebugMode) {
      print(text.data);
    }
  });
}
