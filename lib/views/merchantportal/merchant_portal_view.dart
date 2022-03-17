import 'package:flutter/material.dart';
import 'package:merchant_app/views/merchantportal/merchant_content_desktop.dart';
import 'package:merchant_app/views/merchantportal/merchant_content_mobile.dart';
import 'package:merchant_app/widgets/home_page_footer/home_page_footer.dart';
import 'package:merchant_app/widgets/navigation_bar/navigation_bar.dart';
import 'package:responsive_builder/responsive_builder.dart';

class MerchantPortalView extends StatefulWidget {
  const MerchantPortalView({Key? key}) : super(key: key);

  @override
  State<MerchantPortalView> createState() => _MerchantPortalViewState();
}

class _MerchantPortalViewState extends State<MerchantPortalView> {
  @override
  Widget build(BuildContext context) {
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
            key: Key("merchantMainTitle"),
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
  }
}
