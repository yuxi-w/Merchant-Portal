import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:merchant_app/locator.dart';
import 'package:merchant_app/views/merchantportal/add_item/add_item.dart';

void main() {
  testWidgets('Merchant Portal Add Item Page test',
      (WidgetTester tester) async {
    setupLocator();
    await tester
        .pumpWidget(const MaterialApp(home: Scaffold(body: AddItemView())));

    final title = find.byKey(const ValueKey("add_item_merchant"));
    expect(title, findsOneWidget);
    if (kDebugMode) {
      print('test title completed');
    }

    expect(find.text("Item Name"), findsOneWidget);
    if (kDebugMode) {
      print("Item Name Input Field found");
    }

    expect(find.text("\$ Item Price"), findsOneWidget);
    if (kDebugMode) {
      print("Item Price Input Field found");
    }

    expect(find.text("Item Category"), findsOneWidget);
    if (kDebugMode) {
      print("Item Category Input Field found");
    }

    expect(find.text("Description"), findsOneWidget);
    if (kDebugMode) {
      print("Item Description Input Field found");
    }

    final additembutton =
        find.byKey(const ValueKey("add_item_button_merchant"));
    expect(additembutton, findsOneWidget);
    if (kDebugMode) {
      print('Add item button found');
    }
  });
}
