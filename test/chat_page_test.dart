import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:merchant_app/locator.dart';
import 'package:merchant_app/views/discussion/discussion_view.dart';

void main() {
  testWidgets('Chat page test', (WidgetTester tester) async {
    setupLocator();
    await tester.pumpWidget(const MaterialApp(home: DiscussionView()));

    ///Test main text
    final chatPageMainText = find.byKey(const ValueKey("chat_page_main_title"));
    expect(chatPageMainText, findsOneWidget);
    var text = chatPageMainText.evaluate().single.widget as Text;
    if (kDebugMode) {
      print(text.data);
    }

    ///Test text form fields
    expect(find.byType(TextFormField), findsNWidgets(2));
    if (kDebugMode) {
      print("Text fields work fine");
    }

    ///Test send button
    final sendButton = find.byKey(const Key("chat_page_send_button"));
    expect(sendButton, findsOneWidget);
    await tester.tap(sendButton);
    await tester.pump();
    if (kDebugMode) {
      print("Send button works fine");
    }
  });
}
