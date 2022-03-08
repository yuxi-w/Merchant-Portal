import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:merchant_app/locator.dart';
import 'package:merchant_app/views/editpersonalinfo/edit_personal_info_view.dart';

void main() {
  testWidgets('Personal Info Page test', (WidgetTester tester) async {
    setupLocator();
    await tester.pumpWidget(
        const MaterialApp(home: Scaffold(body: EditPersonalInfoView())));

    //test input widgets availibility -- finding input fields using their hint-text
    expect(find.text("First Name - Last Name"), findsOneWidget);
    if (kDebugMode) {
      print("Name input widget found");
    }

    expect(find.text("+1 123 1231231"), findsOneWidget);
    if (kDebugMode) {
      print("Phone input widget found");
    }

    expect(find.text("Merchant-user1@gmail.com"), findsOneWidget);
    if (kDebugMode) {
      print("Email input widget found");
    }

    expect(find.text("129 Ashburn, Ottawa, ON, CA"), findsOneWidget);
    if (kDebugMode) {
      print("Address input widget found");
    }

    expect(find.text("K2N-0A8"), findsOneWidget);
    if (kDebugMode) {
      print("Zip input widget found");
    }

    expect(find.text("Enter new password"), findsOneWidget);
    if (kDebugMode) {
      print("Password input widget found");
    }

    expect(find.text("Re enter new password"), findsOneWidget);
    if (kDebugMode) {
      print("Confirm Password input widget found");
    }

    //find cancel and save button
    expect(find.text("Cancel"), findsOneWidget);
    if (kDebugMode) {
      print("Cancel button found");
    }

    expect(find.text("Save"), findsOneWidget);
    if (kDebugMode) {
      print("Save button found");
    }

    //test if buttons are working properly
    final cancelfinder = find.byKey(const Key("editinfo_cancel_button"));
    expect(cancelfinder, findsOneWidget);
    await tester.tap(cancelfinder);
    await tester.pump();
    if (kDebugMode) {
      print("Cancel button works fine");
    }

    final savefinder = find.byKey(const Key("editinfo_save_button"));
    expect(savefinder, findsOneWidget);
    await tester.tap(savefinder);
    await tester.pump();
    if (kDebugMode) {
      print("Save button works fine");
    }
  });
}
