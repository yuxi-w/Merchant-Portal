import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:merchant_app/locator.dart';
import 'package:merchant_app/views/aboutpage/about_page_view.dart';

void main() {
  testWidgets('About page test', (WidgetTester tester) async {
    setupLocator();
    await tester.pumpWidget(const MaterialApp(home: AboutView()));

    ///Test main text
    final aboutText = find.byKey(const ValueKey("about_us_text_key"));
    expect(aboutText, findsOneWidget);
    var text = aboutText.evaluate().single.widget as Text;
    if (kDebugMode) {
      print(text.data);
    }
  });
}
