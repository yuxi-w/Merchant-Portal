import 'package:flutter/material.dart';
import 'package:merchant_app/views/login/login_left_view.dart';
import 'package:merchant_app/views/login/login_right_view.dart';
import 'package:merchant_app/widgets/home_page_footer/home_page_footer.dart';
import 'package:merchant_app/widgets/navigation_bar/navigation_bar.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          margin: const EdgeInsets.fromLTRB(16, 16, 64, 16),
          child: const MyNavigationBar(),
        ),
        Container(
          margin: const EdgeInsets.all(16),
          child: Flexible(
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
                    children: [
                      const LoginLeftView(),
                      if (MediaQuery.of(context).size.width > 900)
                        const LoginRightView(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        const HomePageFooter()
      ],
    );
  }
}
