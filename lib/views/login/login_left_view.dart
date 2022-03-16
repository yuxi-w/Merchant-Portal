import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:merchant_app/datamodel/userInfo/UserInfo.dart';
import 'package:merchant_app/locator.dart';
import 'package:merchant_app/routing/route_names.dart';
import 'package:merchant_app/services/navigation_service.dart';
import 'package:merchant_app/constants/methods/validation_methods.dart';
import 'package:merchant_app/constants/constants/AppConst.dart';

import 'package:merchant_app/constants/constants/globals.dart' as globals;
import 'package:merchant_app/datamodel/userInfo/UserInfo.dart';

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

  Future<void> getUserInfo(int id) async {
    try {
      Response response = await get(Uri.parse('${baseUrl}shopuser/$id'));
      if (response.statusCode == 200) {
        // If the server did return a 200 OK response,
        // then parse the JSON.
        var parsedjson = (jsonDecode(response.body));
        globals.name = parsedjson[0]['name'];
        globals.profilePicture = parsedjson[0]['profilePicture'];
        globals.phoneNumber = parsedjson[0]['phoneNumber'];
        globals.email = parsedjson[0]['email'];
        globals.address = parsedjson[0]['address'];
        globals.zipcode = parsedjson[0]['zipcode'];
        globals.password = parsedjson[0]['password'];
        globals.isBuyer = parsedjson[0]['isBuyer'];
        globals.shoppingBag = parsedjson[0]['shoppingBag'];
        globals.orderHistory = parsedjson[0]['orderHistory'];
      } else {
        // If the server did not return a 200 OK response,
        // then throw an exception.
        print('Failed to load user list');
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> login(String email, pass) async {
    try {
      Response response = await post(
        Uri.parse('${baseUrl}shopuser/login').replace(queryParameters: {
          'email': email,
          'password': pass,
        }),
      );
      if (response.statusCode == 200) {
        var data = (response.body.toString());
        globals.id = int.parse(data);
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
                    controller: _email,
                    //validator: EmailFieldValidator.validate,
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
                            // onConfirmBtnTap: () {
                            //   Navigator.pop(context);
                            // },
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
    locator<NavigationService>().navigateTo(SignUpRoute, null);
  }

  void goToHome() {
    locator<NavigationService>().navigateTo(HomeRoute, null);
  }
}
