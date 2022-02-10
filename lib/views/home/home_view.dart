import 'package:flutter/material.dart';
import 'package:merchant_app/views/home/home_content_desktop.dart';
import 'package:merchant_app/views/home/home_content_mobile.dart';
import 'package:merchant_app/widgets/home_page_footer/home_page_footer.dart';
import 'package:merchant_app/widgets/navigation_bar/navigation_bar.dart';
import 'package:responsive_builder/responsive_builder.dart';

/// This is our Home Page
class HomeView extends StatefulWidget {
  const HomeView({BuildContext? appContext, Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          /// Top Navigation Bar
          margin: const EdgeInsets.fromLTRB(16, 16, 64, 16),
          child: const MyNavigationBar(),
        ),

        /// Main Content is a List which shows the products in Home Page
        ScreenTypeLayout(
          mobile: const HomeContentMobile(),
          desktop: const HomeContentDesktop(),
        ),

        /// Page Footer
        const HomePageFooter()
      ],
    );
  }
}
