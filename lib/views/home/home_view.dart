import 'package:flutter/material.dart';
import 'package:merchant_app/widgets/home_page_footer/home_page_footer.dart';
import 'package:merchant_app/widgets/home_page_list_view/home_page_list_view.dart';
import 'package:merchant_app/widgets/navigation_bar/navigation_bar.dart';
import 'package:merchant_app/widgets/navigation_drawer/navigation_drawer.dart';
import 'package:responsive_builder/responsive_builder.dart';

class HomeView extends StatefulWidget {
  const HomeView(BuildContext appContext, {Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

/// This is our Home Page
class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) => Scaffold(
        /// Creating Drawer Layout when screen shrinks
        drawer: sizingInformation.deviceScreenType == DeviceScreenType.mobile
            ? const NavigationDrawer()
            : null,
        backgroundColor: Colors.white,

        /// Main Page
        body: SingleChildScrollView(
          child: Container(
            color: Colors.black12,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                /// Top Navigation Bar
                Container(
                  margin: const EdgeInsets.fromLTRB(16, 16, 64, 16),
                  child: const MyNavigationBar(),
                ),

                /// Main List View
                const HomePageListView(),

                /// Home Page Footer
                const HomePageFooter()
              ],
            ),
          ),
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
