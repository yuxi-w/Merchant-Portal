import 'dart:ui';
import 'package:flutter/material.dart';

class LoginRightView extends StatefulWidget {
  const LoginRightView({Key? key}) : super(key: key);

  @override
  _LoginRightViewState createState() => _LoginRightViewState();
}

class _LoginRightViewState extends State<LoginRightView> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        key: const Key("login_right_view"),
        child: Container(
          color: Colors.orange,
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/shopping_bags.jpg'),
                  fit: BoxFit.cover),
            ),
            child: Center(
              child: SizedBox(
                height: 500,
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 60.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(24),
                        child: Container(
                          alignment: Alignment.topLeft,
                          padding: const EdgeInsets.all(42),
                          child: const Text(
                            "Amazing Deals are \nwaiting for you!\n\nLogin Now",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 28,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
