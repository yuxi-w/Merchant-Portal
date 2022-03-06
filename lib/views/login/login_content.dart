import 'package:flutter/material.dart';
import 'package:merchant_app/views/login/login_left_view.dart';
import 'package:merchant_app/views/login/login_right_view.dart';

class LoginContent extends StatefulWidget {
  const LoginContent({Key? key}) : super(key: key);

  @override
  _LoginContentState createState() => _LoginContentState();
}

class _LoginContentState extends State<LoginContent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      child: Center(
        child: SingleChildScrollView(
          child: Container(
            height: 640,
            width: 1080,
            margin: const EdgeInsets.symmetric(horizontal: 24),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              color: Colors.white,
            ),
            child: Row(
              key: const Key('left_right'),
              children: [
                const LoginLeftView(),
                if (MediaQuery.of(context).size.width > 900)
                  const LoginRightView(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
