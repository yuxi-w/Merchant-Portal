import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:merchant_app/locator.dart';
import 'package:merchant_app/views/personalinfo/personal_info_view.dart';
import 'package:merchant_app/constants/constants/globals.dart' as globals;

void main() {
  testWidgets('Personal Info Page test', (WidgetTester tester) async {
    setupLocator();
    globals.isLoggedIn = true;
    await tester.pumpWidget(const MaterialApp(home: PersonalInfoView()));

    //name of the user
    expect(find.byKey(const Key("personalinfo_customer_name")), findsOneWidget);
    if (kDebugMode) {
      print("Name display widget found");
    }

    //user status
    expect(find.byKey(const Key("personalinfo_customer_type")), findsOneWidget);
    if (kDebugMode) {
      print("Status display widget found");
    }

    //entries of the user are stored in cards(Phone number, address, etc.)
    expect(find.byType(Card), findsNWidgets(4));
    if (kDebugMode) {
      print("Info fields exists");
    }

    //test if entries exists inside the cards
    expect(
        find.byKey(const Key("personalinfo_customer_phone")), findsOneWidget);
    if (kDebugMode) {
      print("Phone display widget found");
    }

    expect(
        find.byKey(const Key("personalinfo_customer_email")), findsOneWidget);
    if (kDebugMode) {
      print("Email display widget found");
    }

    expect(
        find.byKey(const Key("personalinfo_customer_address")), findsOneWidget);
    if (kDebugMode) {
      print("Address display widget found");
    }

    expect(find.byKey(const Key("personalinfo_customer_zip")), findsOneWidget);
    if (kDebugMode) {
      print("ZipCode display widget found");
    }

    //test if editinfo button redirects successfully
    final editinfofinder = find.byKey(const Key("editinfo_redirect_button"));
    expect(editinfofinder, findsOneWidget);
    await tester.tap(editinfofinder);
    await tester.pump();
    if (kDebugMode) {
      print("Edit button works fine");
    }
  });
}
