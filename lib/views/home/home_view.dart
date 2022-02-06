import 'package:flutter/material.dart';
import 'package:merchant_app/widgets/home_page_list_view/home_page_list_view.dart';
import 'package:merchant_app/widgets/navigation_bar/navigation_bar.dart';
import 'package:merchant_app/widgets/navigation_drawer/navigation_drawer.dart';
import 'package:responsive_builder/responsive_builder.dart';

class HomeView extends StatefulWidget {
  const HomeView(BuildContext appContext, {Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

// This is our Home Page
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
          // Main Page
          body: Container(
            // Main Column
            child: Column(
              children: [
                /// Navigation Bar Container
                Container(
                  margin: const EdgeInsets.all(16),
                  child: Column(
                    children: const [
                      /// Navigation Bar
                      MyNavigationBar(),
                    ],
                  ),
                ),

                /// Main List View
                HomePageListView(),

                /// Bottom Navigation Bar
                // Expanded(
                //     child: Align(
                //   alignment: FractionalOffset.bottomCenter,
                //   child: Container(
                //     margin: EdgeInsets.all(16),
                //     child: Row(
                //       children: [Text("Bottom Nav Bar")],
                //     ),
                //   ),
                // ))
              ],
            ),
          )),
    );
  }
}
