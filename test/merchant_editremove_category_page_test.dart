import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:merchant_app/locator.dart';
import 'package:merchant_app/views/merchantportal/remove_edit_category/remove_edit_category_item.dart';

void main() {
  testWidgets('Merchant Portal Edit/Remove Item Page test',
      (WidgetTester tester) async {
    setupLocator();
    await tester.pumpWidget(const MaterialApp(
        home: RemoveEditCategoryItem(
      categoryName: 'Category name',
      imgHeight: 125,
      imgWidth: 125,
    )));

    final title = find.byKey(const ValueKey("remove_category_title"));
    expect(title, findsOneWidget);
    if (kDebugMode) {
      print('Title test completed');
    }

    final name = find.byKey(const ValueKey("remove_category_description"));
    expect(name, findsOneWidget);
    if (kDebugMode) {
      print('Category Name test completed');
    }

    final img = find.byKey(const ValueKey("category_remove_pic"));
    expect(img, findsOneWidget);
    if (kDebugMode) {
      print('Category Image test completed');
    }

    expect(find.text("Remove Category"), findsOneWidget);
    if (kDebugMode) {
      print("Remove Category button found");
    }

    expect(find.text("Edit Category"), findsOneWidget);
    if (kDebugMode) {
      print("Edit Category button found");
    }
  });
}
