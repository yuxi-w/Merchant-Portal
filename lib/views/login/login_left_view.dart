import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:merchant_app/locator.dart';
import 'package:merchant_app/routing/route_names.dart';
import 'package:merchant_app/services/navigation_service.dart';
import 'package:merchant_app/constants/methods/validation_methods.dart';
import 'package:merchant_app/constants/constants/AppConst.dart';
import 'package:merchant_app/constants/constants/globals.dart' as globals;

import 'package:cool_alert/cool_alert.dart';

class LoginLeftView extends StatefulWidget {
  const LoginLeftView({Key? key}) : super(key: key);

  @override
  _LoginLeftViewState createState() => _LoginLeftViewState();
}

class _LoginLeftViewState extends State<LoginLeftView> {
  final loginformkey = GlobalKey<FormState>();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _pass = TextEditingController();
  bool success = false;
  String errmsg = "temp";

  Future<void> getUserInfo(String id) async {
    try {
      Response response = await get(Uri.parse('${baseUrl}shopuser/$id'));
      if (response.statusCode == 200) {
        // If the server did return a 200 OK response,
        // then parse the JSON.
        var parsedjson = (jsonDecode(response.body));
        globals.name = parsedjson['name'];
        globals.profilePicture = parsedjson['profilePicture'];
        globals.phoneNumber = parsedjson['phoneNumber'];
        globals.email = parsedjson['email'];
        globals.address = parsedjson['address'];
        globals.zipcode = parsedjson['zipcode'];
        globals.password = parsedjson['password'];
        globals.isBuyer = parsedjson['isBuyer'];
        globals.shoppingBag = parsedjson['shoppingBag'];
        globals.orderHistory = parsedjson['orderHistory'];
      } else {
        // If the server did not return a 200 OK response,
        // then throw an exception.
        print('Failed to load user list');
      }
    } catch (e) {
      print('${baseUrl}shopuser/$id');
      print("here");
      print(e.toString());
    }
  }

  Future<void> login(String email, pass) async {
    try {
      Response response = await post(
        Uri.parse('${baseUrl}shopuser/login').replace(queryParameters: {
          'email': email.toLowerCase().trim(),
          'password': pass,
        }),
      );
      if (response.statusCode == 200) {
        var data = (response.body.toString());
        globals.id = data;
        globals.isLoggedIn = true;
        setState(() {
          success = true;
        });
      } else {
        var data = (response.body.toString());
        setState(() {
          success = false;
          errmsg = data;
        });
      }
    } catch (e) {
      setState(() {
        success = false;
      });
      print(e.toString());
    }
  }

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
                    controller: _email,
                    validator: EmailFieldValidator.validate,
                  ),

                  /// Password Text Field
                  TextFormField(
                    obscureText: true,
                    decoration: const InputDecoration(
                      label: Text("Password"),
                      hintText: "Please write your password",
                    ),
                    controller: _pass,
                    validator: EmptyFieldValidator.validate,
                  ),
                  const SizedBox(height: 24),

                  /// Login Button
                  MaterialButton(
                    onPressed: () async {
                      if (loginformkey.currentState!.validate()) {
                        //onpress goes in here
                        await login(
                            _email.text.toString(), _pass.text.toString());
                        if (success) {
                          await getUserInfo(globals.id);
                          CoolAlert.show(
                            context: context,
                            type: CoolAlertType.success,
                            text: "Login Successful\nWelcome " + globals.name,
                          );
                          goToHome();
                        } else {
                          CoolAlert.show(
                            context: context,
                            type: CoolAlertType.error,
                            title: 'Oops...',
                            text: errmsg,
                            loopAnimation: false,
                          );
                        }
                      }
                    },
                    child: const Text("Login"),
                    key: const Key("Loginbutton"),
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
                      style: TextStyle(fontSize: 15),
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
    locator<NavigationService>().navigateTo(SignUpRoute, null);
  }

  void goToHome() {
    locator<NavigationService>().navigateTo(HomeRoute, null);
  }
}
