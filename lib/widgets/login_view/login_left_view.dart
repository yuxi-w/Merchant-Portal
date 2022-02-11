import 'package:flutter/material.dart';

class LoginLeftView extends StatefulWidget {
  const LoginLeftView({Key? key}) : super(key: key);

  @override
  _LoginLeftViewState createState() => _LoginLeftViewState();
}

class _LoginLeftViewState extends State<LoginLeftView> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Center(
      child: Padding(
        padding: const EdgeInsets.all(120.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
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
            const TextField(
              decoration: InputDecoration(
                label: Text("Email Address"),
                hintText: "abc@xyz.com",
              ),
            ),
            const TextField(
              obscureText: true,
              decoration: InputDecoration(
                label: Text("Password"),
                hintText: "Please write your password",
              ),
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
            MaterialButton(
              onPressed: () {},
              child: Text("Login"),
              minWidth: double.infinity,
              height: 52,
              elevation: 24,
              color: Colors.amber.shade700,
              textColor: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32)),
            ),
            const SizedBox(height: 32),
            const Text(
              "Don't have an account yet? Click here to Signup!",
              style: TextStyle(fontSize: 12),
            )
          ],
        ),
      ),
    ));
  }
}
