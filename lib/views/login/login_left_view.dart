import 'package:flutter/material.dart';
import 'package:merchant_app/locator.dart';
import 'package:merchant_app/routing/route_names.dart';
import 'package:merchant_app/services/navigation_service.dart';
import 'package:merchant_app/constants/methods/validation_methods.dart';

class LoginLeftView extends StatefulWidget {
  const LoginLeftView({Key? key}) : super(key: key);

  @override
  _LoginLeftViewState createState() => _LoginLeftViewState();
}

class _LoginLeftViewState extends State<LoginLeftView> {
  final loginformkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Expanded(
      key: const Key("login_left_view"),
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(120.0),
            child: Form(
              key: loginformkey,
              child: ListView(
                // mainAxisSize: MainAxisSize.max,
                // mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  const Text(
                    "Login",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  const Text(
                    "Lets get you logged in!",
                    style: TextStyle(fontSize: 12),
                  ),
                  const SizedBox(height: 24),

                  /// Input text Field
                  TextFormField(
                    decoration: const InputDecoration(
                      label: Text("Email Address"),
                      hintText: "abc@xyz.com",
                    ),
                    validator: EmailFieldValidator.validate,
                  ),

                  /// Password Text Field
                  TextFormField(
                    obscureText: true,
                    decoration: const InputDecoration(
                      label: Text("Password"),
                      hintText: "Please write your password",
                    ),
                    validator: EmptyFieldValidator.validate,
                  ),
                  const SizedBox(height: 24),
                  Align(
                    alignment: Alignment.topRight,
                    child: MaterialButton(
                      child: const Text("Forget password?"),
                      onPressed: () {},
                    ),
                  ),
                  const SizedBox(height: 24),

                  /// Login Button
                  MaterialButton(
                    onPressed: () {
                      if (loginformkey.currentState!.validate()) {
                        //onpress goes in here
                      }
                    },
                    child: const Text("Login"),
                    minWidth: double.infinity,
                    height: 52,
                    elevation: 24,
                    color: Colors.amber.shade700,
                    textColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32)),
                  ),
                  const SizedBox(height: 28),
                  TextButton(
                    key: const Key("signup_redirect_button"),
                    onPressed: () {
                      goToSignUpPage();
                    },
                    child: const Text(
                      "Don't have an account yet? Click here to Signup!",
                      style: TextStyle(fontSize: 12),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void goToSignUpPage() {
    locator<NavigationService>().navigateTo(SignUpRoute,null);
  }
}
