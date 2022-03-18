import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:merchant_app/locator.dart';
import 'package:merchant_app/views/signup/sign_up_view.dart';

void main() {
  testWidgets('Signup View Page test', (WidgetTester tester) async {
    setupLocator();
    await tester
        .pumpWidget(const MaterialApp(home: Scaffold(body: SignUpPageView())));

    //Testing various input field widgets in the signup page

    final signupType = find.byKey(const ValueKey("signupTypeSelection"));
    expect(signupType, findsOneWidget);
    if (kDebugMode) {
      print('test Signup type completed');
    }

    expect(find.text("Full Name"), findsOneWidget);
    if (kDebugMode) {
      print("Name input widget found");
    }

    expect(find.text("Email Address"), findsOneWidget);
    if (kDebugMode) {
      print("Email input widget found");
    }

    expect(find.text("Phone Number"), findsOneWidget);
    if (kDebugMode) {
      print("Phone input widget found");
    }

    expect(find.text("Address"), findsOneWidget);
    if (kDebugMode) {
      print("Address input widget found");
    }

    expect(find.text("Zip Code"), findsOneWidget);
    if (kDebugMode) {
      print("Zip input widget found");
    }

    expect(find.text("Password"), findsOneWidget);
    if (kDebugMode) {
      print("Password input widget found");
    }

    expect(find.text("Reenter Password"), findsOneWidget);
    if (kDebugMode) {
      print("Confirm Password widget found");
    }

    expect(find.text("Already have an account? Click here to Login!"),
        findsOneWidget);
    if (kDebugMode) {
      print("Login button found");
    }

    final loginfinder = find.byKey(const Key("login_redirect_button"));
    expect(loginfinder, findsOneWidget);
    await tester.tap(loginfinder);
    await tester.pump();
    if (kDebugMode) {
      print("login button works fine");
    }
  });
}
