import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:merchant_app/locator.dart';
import 'package:merchant_app/views/merchantportal/merchant_portal_view.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:merchant_app/constants/constants/globals.dart' as globals;

void main() {
  testWidgets('Merchant Portal page test', (WidgetTester tester) async {
    setupLocator();
    await tester.pumpWidget(const MaterialApp(home: MerchantPortalView()));

    if (globals.isLoggedIn && globals.isBuyer == false) {
      ///Test main text
      final merchantPortalMainText =
          find.byKey(const ValueKey("merchant_portal_main_title"));
      expect(merchantPortalMainText, findsOneWidget);
      var text = merchantPortalMainText.evaluate().single.widget as Text;
      if (kDebugMode) {
        print(text.data);
      }

      ///Test Screen Type Layout
      expect(find.byType(ScreenTypeLayout), findsNWidgets(1));
      if (kDebugMode) {
        print("Screen Type Layout works fine");
      }
    } else {
      expect(find.byType(ListView), findsNWidgets(2));
      if (kDebugMode) {
        print("List Views work fine");
      }

      expect(find.byType(Column), findsNWidgets(1));
      if (kDebugMode) {
        print("Column works fine");
      }

      final merchantPortalAccessText =
          find.byKey(const ValueKey("merchant_portal_text_restricted_access"));
      expect(merchantPortalAccessText, findsOneWidget);
      var text1 = merchantPortalAccessText.evaluate().single.widget as Text;
      if (kDebugMode) {
        print(text1.data);
      }

      final merchantPortalLoginText =
          find.byKey(const ValueKey("merchant_portal_text_please_login"));
      expect(merchantPortalLoginText, findsOneWidget);
      var text2 = merchantPortalLoginText.evaluate().single.widget as Text;
      if (kDebugMode) {
        print(text2.data);
      }
    }
  });
}
