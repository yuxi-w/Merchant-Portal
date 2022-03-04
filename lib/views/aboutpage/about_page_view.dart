import 'package:flutter/material.dart';
import 'package:merchant_app/constants/colors/app_colors.dart';
import 'package:merchant_app/widgets/home_page_footer/home_page_footer.dart';
import 'package:merchant_app/widgets/navigation_bar/navigation_bar.dart';

class AboutView extends StatefulWidget {
  const AboutView({Key? key}) : super(key: key);

  @override
  _AboutViewState createState() => _AboutViewState();
}

class _AboutViewState extends State<AboutView> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        /// Top Navigation Bar
        Container(
          margin: const EdgeInsets.fromLTRB(16, 16, 64, 16),
          child: const MyNavigationBar(),
        ),

        /// Main content of the page
        Container(
          alignment: Alignment.center,
          child: SafeArea(
            child: Container(
              constraints: const BoxConstraints(minWidth: 700, maxWidth: 900),
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  /// Top Image
                  Row(
                      mainAxisAlignment: MainAxisAlignment
                          .center, //Center Row contents horizontally,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        /// top Picture1 section!
                        CircleAvatar(
                          radius: 50.0,
                          backgroundImage: AssetImage('./assets/logo.png'),
                        ),
                      ]),

                  /// Divider!
                  const SizedBox(
                    width: 1350.0,
                    height: 20.0,
                    child: Divider(
                      color: Color.fromARGB(255, 90, 38, 31),
                    ),
                  ),

                  ///  About title
                  Text(
                    'About us',
                    style: TextStyle(
                        fontSize: 40.0,
                        fontWeight: FontWeight.bold,
                        color: infoPageTextColor),
                    key: const Key("aboutUsTitle"),
                  ),

                  /// Smaller wrapper to keep everything in center and look nice and professional
                  Container(
                      constraints:
                          const BoxConstraints(minWidth: 500, maxWidth: 800),
                      padding: const EdgeInsets.all(10),
                      child: Column(children: [
                        Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 20),
                            child: Column(
                              children: const [
                                /// About us main text
                                Text(
                                  "Hello! This is our project for the course CSI5112 - Software Engineering, "
                                  "offered by the EECS. We are a group of 5 master's students from uOttawa."
                                  "The project includes following topics initially:"
                                  "portal for selecting and ordering items, saving to and loading from NoSQL databases, functionalities "
                                  "of shopping carts and platforms for basic interactions between clients and merchants."
                                  "Here are the members of our group: Mohammadreza Davoudi (Payam), Alim Manjiyani, "
                                  "Zhiyi Dong, Alireza Montazeralzohour, Yuxi Wang",
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 20,
                                      height: 1.5),
                                  key: Key("productDetailDescription"),
                                )
                              ],
                            )),
                      ]))
                ],
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
