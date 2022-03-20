import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:merchant_app/locator.dart';
import 'package:merchant_app/views/merchantportal/add_category/add_category.dart';

void main() {
  testWidgets('Merchant Portal Add Item Page test',
      (WidgetTester tester) async {
    setupLocator();
    await tester
        .pumpWidget(const MaterialApp(home: Scaffold(body: AddCategoryView())));

    final title = find.byKey(const ValueKey("add_category_merchant"));
    expect(title, findsOneWidget);
    if (kDebugMode) {
      print('test title completed');
    }

    expect(find.text("Category Name"), findsOneWidget);
    if (kDebugMode) {
      print("Category Name Input Field found");
    }

    expect(find.text("First Item Name"), findsOneWidget);
    if (kDebugMode) {
      print("First Item Name Input Field found");
    }

    expect(find.text("\$ First Item Price"), findsOneWidget);
    if (kDebugMode) {
      print("First Item Price Input Field found");
    }

    expect(find.text("First Item Description"), findsOneWidget);
    if (kDebugMode) {
      print("First Item Description Input Field found");
    }

    final addcatbutton =
        find.byKey(const ValueKey("add_category_button_merchant"));
    expect(addcatbutton, findsOneWidget);
    if (kDebugMode) {
      print('Add Category button found');
    }
  });
}
