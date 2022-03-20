import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:merchant_app/locator.dart';
import 'package:merchant_app/views/login/login_view.dart';

void main() {
  testWidgets('Login View Page test', (WidgetTester tester) async {
    setupLocator();

    await tester.pumpWidget(const MaterialApp(home: LoginView()));

    //test if the form is displayed
    final loginrightviewfinder = find.byKey(const Key('left_right'));
    final loginleftfinder = find.byKey(const Key('login_left_view'));
    expect(loginrightviewfinder, findsOneWidget);
    expect(loginleftfinder, findsOneWidget);
    if (kDebugMode) {
      print("Form view test complete");
    }

    //test email input widget
    expect(find.text("Email Address"), findsOneWidget);
    if (kDebugMode) {
      print("Email input widget found");
    }

    //test password input widget
    expect(find.text("Password"), findsOneWidget);
    if (kDebugMode) {
      print("Email input widget found");
    }

    //test login button
    final loginbutton = find.byKey(const ValueKey("Loginbutton"));
    expect(loginbutton, findsOneWidget);
    if (kDebugMode) {
      print("Login button found");
    }

    //test signup button
    expect(find.text("Don't have an account yet? Click here to Signup!"),
        findsOneWidget);

    //test tapping signup button
    final signupfinder = find.byKey(const Key("signup_redirect_button"));
    expect(signupfinder, findsOneWidget);
    await tester.tap(signupfinder);
    await tester.pump();
    if (kDebugMode) {
      print("Signup button works fine");
    }
  });
}
