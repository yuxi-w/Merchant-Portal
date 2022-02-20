import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:merchant_app/locator.dart';
import 'package:merchant_app/widgets/home_page_footer/home_page_footer.dart';

void main() {
  testWidgets('Footer test', (WidgetTester tester) async {
    setupLocator();
    await tester.pumpWidget(const MaterialApp(home: HomePageFooter()));

    ///Test home button
    final homeButton = find.byKey(const ValueKey("footerHomeButton"));
    expect(homeButton, findsOneWidget);
    await tester.tap(homeButton);
    await tester.pump();
    if (kDebugMode) {
      print('home button works fine');

      ///Test personal info button
      final personalInfoButton =
          find.byKey(const ValueKey("footerPersonalInfoButton"));
      expect(personalInfoButton, findsOneWidget);
      await tester.tap(personalInfoButton);
      await tester.pump();
      if (kDebugMode) {
        print('personal info button works fine');
      }

      ///Test about button
      final aboutButton = find.byKey(const ValueKey("footerAboutButton"));
      expect(aboutButton, findsOneWidget);
      await tester.tap(aboutButton);
      await tester.pump();
      if (kDebugMode) {
        print('about button works fine');
      }

      ///Test first text
      final copyrightText = find.byKey(const ValueKey("footerCopyrightText"));
      expect(copyrightText, findsOneWidget);
      var text = copyrightText.evaluate().single.widget as Text;
      if (kDebugMode) {
        print(text.data);
      }

      ///Test second text
      final group6Text = find.byKey(const ValueKey("footerGroup6Text"));
      expect(group6Text, findsOneWidget);
      var text1 = group6Text.evaluate().single.widget as Text;
      if (kDebugMode) {
        print(text1.data);
      }
    }
  });
}
