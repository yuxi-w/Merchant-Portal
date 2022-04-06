import 'package:flutter/material.dart';
import 'package:merchant_app/views/merchantportal/merchant_content_desktop.dart';
import 'package:merchant_app/views/merchantportal/merchant_content_mobile.dart';
import 'package:merchant_app/widgets/home_page_footer/home_page_footer.dart';
import 'package:merchant_app/widgets/navigation_bar/navigation_bar.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'package:merchant_app/constants/constants/globals.dart' as globals;

class MerchantPortalView extends StatefulWidget {
  const MerchantPortalView({Key? key}) : super(key: key);

  @override
  State<MerchantPortalView> createState() => _MerchantPortalViewState();
}

class _MerchantPortalViewState extends State<MerchantPortalView> {
  @override
  Widget build(BuildContext context) {
    if (globals.isLoggedIn && globals.isBuyer == false) {
      return ListView(
        children: [
          Container(
            /// Top Navigation Bar
            margin: const EdgeInsets.fromLTRB(16, 16, 64, 16),
            child: const MyNavigationBar(),
          ),

          /// The Text Showing "Home"
          Container(
            alignment: Alignment.centerLeft,
            margin: const EdgeInsets.fromLTRB(70, 20, 10, 10),
            child: const Text(
              "Merchant Portal",
              textAlign: TextAlign.right,
              key: Key("merchant_portal_main_title"),
              style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
          ),

          /// Main Content is a List which shows the products in Home Page
          ScreenTypeLayout(
            mobile: const MerchantContentMobile(),
            desktop: const MerchantContentDesktop(),
          ),

          /// Page Footer
          const HomePageFooter()
        ],
      );
    } else {
      return ListView(
        children: [
          Container(
            /// Top Navigation Bar
            margin: const EdgeInsets.fromLTRB(16, 16, 64, 16),
            child: const MyNavigationBar(),
          ),

          /// The Text Showing "Merchant Portal"
          Container(
            alignment: Alignment.centerLeft,
            margin: const EdgeInsets.fromLTRB(70, 20, 10, 10),
            child: const Text(
              "Merchant Portal",
              textAlign: TextAlign.right,
              key: Key("merchantMainTitle"),
              style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
          ),

          /// Main Content
          Container(
            constraints: const BoxConstraints(
                minHeight: 350, minWidth: 300, maxWidth: 1000),
            alignment: Alignment.center,
            margin: const EdgeInsets.fromLTRB(70, 20, 10, 110),
            child: Column(
              key: const Key("notLoggedInText_merchantPortal"),
              children: const [
                Center(
                  child: Text(
                    "Restricted Access!",
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                    key: Key("merchant_portal_text_restricted_access"),
                  ),
                ),
                Center(
                  child: Text(
                    "Please Login using your Merchant Id and Password to access this content.",
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                    key: Key("merchant_portal_text_please_login"),
                  ),
                ),
              ],
            ),
          ),

          /// Page Footer
          const HomePageFooter()
        ],
      );
    }
  }
}
