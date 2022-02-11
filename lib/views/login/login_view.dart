import 'package:flutter/material.dart';
//import 'package:merchant_app/widgets/login_view/login_page_view.dart';
import 'package:merchant_app/widgets/signup_view/signup_page_view.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return const SignupPageView();
    //return const LoginPageView();
  }
}
