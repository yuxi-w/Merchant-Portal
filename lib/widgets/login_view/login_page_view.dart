import 'package:flutter/material.dart';
import 'package:merchant_app/widgets/home_page_footer/home_page_footer.dart';
import 'package:merchant_app/widgets/login_view/login_left_view.dart';
import 'package:merchant_app/widgets/login_view/login_right_view.dart';
import 'package:merchant_app/widgets/navigation_bar/navigation_bar.dart';

class LoginPageView extends StatefulWidget {
  const LoginPageView({Key? key}) : super(key: key);

  @override
  _LoginPageViewState createState() => _LoginPageViewState();
}

class _LoginPageViewState extends State<LoginPageView> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          margin: const EdgeInsets.fromLTRB(16, 16, 64, 16),
          child: const MyNavigationBar(),
        ),
        Container(
          margin: EdgeInsets.all(16),
          child: Flexible(
            child: Container(
              child: Center(
                child: SingleChildScrollView(
                  child: Container(
                    height: 640,
                    width: 1080,
                    margin: EdgeInsets.symmetric(horizontal: 24),
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
        ),
        HomePageFooter()
      ],
    );
  }
}
