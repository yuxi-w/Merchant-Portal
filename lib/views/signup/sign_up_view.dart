import 'package:flutter/material.dart';
import 'package:merchant_app/widgets/home_page_footer/home_page_footer.dart';
import 'package:merchant_app/widgets/navigation_bar/navigation_bar.dart';

/// This is the Sign Up page
class SignUpPageView extends StatefulWidget {
  const SignUpPageView({Key? key}) : super(key: key);

  @override
  _SignUpPageViewState createState() => _SignUpPageViewState();
}

class _SignUpPageViewState extends State<SignUpPageView> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        /// Top Navigation Bar
        Container(
          margin: const EdgeInsets.fromLTRB(16, 16, 64, 16),
          child: const MyNavigationBar(),
        ),

        /// Main Content
        Container(
          margin: const EdgeInsets.all(16),
          child: Flexible(
            child: Center(
              child: SingleChildScrollView(
                child: Container(
                    height: 800,
                    width: 540,
                    margin: const EdgeInsets.symmetric(horizontal: 24),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      color: Colors.white,
                    ),
                    child: Center(
                      child: Padding(
                        //padding: const EdgeInsets.all(60.0),
                        padding: const EdgeInsets.fromLTRB(120, 60, 120, 60),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Center(
                              child: Text(
                                "Signup",
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            const Center(
                              child: Text(
                                "Enter your details below",
                                style: TextStyle(fontSize: 15),
                              ),
                            ),
                            const SizedBox(height: 24),
                            const TextField(
                              decoration: InputDecoration(
                                label: Text("Full Name"),
                                //hintText: "abc@xyz.com",
                              ),
                            ),
                            //const SizedBox(height: 24),
                            const TextField(
                              decoration: InputDecoration(
                                label: Text("Email Address"),
                                hintText: "abc@xyz.com",
                              ),
                            ),
                            const TextField(
                              decoration: InputDecoration(
                                label: Text("Phone Number"),
                                hintText: "10 digit phone number 1231231231",
                              ),
                            ),
                            const TextField(
                              decoration: InputDecoration(
                                label: Text("Address"),
                                hintText: "ex 123 Nelson, Ottawa, ON, CA",
                              ),
                            ),
                            const TextField(
                              decoration: InputDecoration(
                                label: Text("Pin Code"),
                                hintText: "ex. K1N 7N8",
                              ),
                            ),
                            const TextField(
                              obscureText: true,
                              decoration: InputDecoration(
                                label: Text("Password"),
                                hintText: "Please write your password",
                              ),
                            ),
                            const TextField(
                              obscureText: true,
                              decoration: InputDecoration(
                                label: Text("Reenter Password"),
                                hintText: "Please reenter your password",
                              ),
                            ),

                            const SizedBox(height: 24),
                            MaterialButton(
                              onPressed: () {},
                              child: Text("Signup"),
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
                              "Already have an account? Click here to Login!",
                              style: TextStyle(fontSize: 15),
                            )
                          ],
                        ),
                      ),
                    )),
              ),
            ),
          ),
        ),

        /// Footer
        const HomePageFooter()
      ],
    );
  }
}
