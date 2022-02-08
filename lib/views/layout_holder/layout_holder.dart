import 'package:flutter/material.dart';
import 'package:merchant_app/locator.dart';
import 'package:merchant_app/routing/route_names.dart';
import 'package:merchant_app/routing/router.dart';
import 'package:merchant_app/services/navigation_service.dart';
import 'package:merchant_app/widgets/home_page_footer/home_page_footer.dart';
import 'package:merchant_app/widgets/navigation_bar/navigation_bar.dart';
import 'package:merchant_app/widgets/navigation_drawer/navigation_drawer.dart';
import 'package:responsive_builder/responsive_builder.dart';

class LayoutHolder extends StatelessWidget {
  const LayoutHolder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) => Scaffold(
        /// Creating Drawer Layout when screen shrinks
        drawer: sizingInformation.deviceScreenType == DeviceScreenType.mobile
            ? const NavigationDrawer()
            : null,
        backgroundColor: Colors.black12,

        /// Main Page
        body: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            /// Top Navigation Bar
            Container(
              margin: const EdgeInsets.fromLTRB(16, 16, 64, 16),
              child: const MyNavigationBar(),
            ),

            /// Main Page Holder
            Expanded(
              child: Navigator(
                key: locator<NavigationService>().navigatorKey,
                onGenerateRoute: generateRoute,
                initialRoute: CategoryRoute,
              ),
            ),

            /// Home Page Footer
            const HomePageFooter()
          ],
        ),

        /// Chat Button
        floatingActionButton: FloatingActionButton(
            elevation: 10.0,
            child: const Icon(Icons.chat),
            backgroundColor: const Color(0xFF162A49),
            onPressed: () {}),
      ),
    );
  }
}
