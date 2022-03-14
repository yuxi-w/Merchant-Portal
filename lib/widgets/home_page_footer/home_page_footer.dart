import 'package:footer/footer.dart';
import 'package:flutter/material.dart';
import 'package:merchant_app/locator.dart';
import 'package:merchant_app/routing/route_names.dart';
import 'package:merchant_app/services/navigation_service.dart';

/// This class is for the pages footer
class HomePageFooter extends StatefulWidget {
  const HomePageFooter({Key? key}) : super(key: key);

  @override
  _HomePageFooterState createState() => _HomePageFooterState();
}

class _HomePageFooterState extends State<HomePageFooter> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: Footer(
        backgroundColor: Colors.black38,
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      SizedBox(
                          height: 45.0,
                          width: 45.0,
                          child: Center(
                            child: Card(
                              elevation: 5.0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    25.0), // half of height and width of Image
                              ),

                              /// Footer Home Button
                              child: IconButton(
                                icon: const Icon(
                                  Icons.home,
                                  size: 20.0,
                                ),
                                color: const Color(0xFF162A49),
                                onPressed: () {
                                  goToHomePage();
                                },
                                key: const Key("footerHomeButton"),
                              ),
                            ),
                          )),
                      SizedBox(
                          height: 45.0,
                          width: 45.0,
                          child: Center(
                            child: Card(
                              elevation: 5.0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    25.0), // half of height and width of Image
                              ),

                              /// Personal Info Button
                              child: IconButton(
                                icon: const Icon(
                                  Icons.fingerprint,
                                  size: 20.0,
                                ),
                                color: const Color(0xFF162A49),
                                onPressed: () {
                                  goToPersonalInfoPage();
                                },
                                key: const Key("footerPersonalInfoButton"),
                              ),
                            ),
                          )),
                      SizedBox(
                          height: 45.0,
                          width: 45.0,
                          child: Center(
                            child: Card(
                              elevation: 5.0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    25.0), // half of height and width of Image
                              ),

                              /// About Page Button
                              child: IconButton(
                                icon: const Icon(
                                  Icons.call,
                                  size: 20.0,
                                ),
                                color: const Color(0xFF162A49),
                                onPressed: () {
                                  goToAboutPage();
                                },
                                key: const Key("footerAboutButton"),
                              ),
                            ),
                          )),
                    ],
                  ),
                ),
                const Text(
                  'Copyright ©2022, All Rights Reserved.',
                  style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 12.0,
                      color: Color(0xFF162A49)),
                  key: Key("footerCopyrightText"),
                ),
                const Text(
                  'Powered by Group 6',
                  style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 12.0,
                      color: Color(0xFF162A49)),
                  key: Key("footerGroup6Text"),
                ),
              ]),
        ),
      ),
    );
  }

  void goToHomePage() {
    locator<NavigationService>().navigateTo(HomeRoute,null);
  }

  void goToPersonalInfoPage() {
    locator<NavigationService>().navigateTo(PersonalInfoRoute,null);
  }

  void goToAboutPage() {
    locator<NavigationService>().navigateTo(AboutRoute,null);
  }
}
