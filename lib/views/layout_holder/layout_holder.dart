import 'package:flutter/material.dart';
import 'package:merchant_app/locator.dart';
import 'package:merchant_app/routing/route_names.dart';
import 'package:merchant_app/routing/router.dart';
import 'package:merchant_app/services/navigation_service.dart';
import 'package:merchant_app/widgets/navigation_drawer/navigation_drawer.dart';
import 'package:responsive_builder/responsive_builder.dart';

/// This page is a template page to switch between different pages.
/// As you can see, the navigator is on this page,
/// which is responsible for switching pages.
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

        /// Navigator for switching pages
        body: Navigator(
          key: locator<NavigationService>().navigatorKey,
          onGenerateRoute: generateRoute,
          initialRoute: HomeRoute,
        ),

        /// Chat Floating Button
        floatingActionButton: FloatingActionButton(
            elevation: 10.0,
            child: const Icon(Icons.chat),
            backgroundColor: const Color(0xFF162A49),
            onPressed: () {}),
      ),
    );
  }
}
