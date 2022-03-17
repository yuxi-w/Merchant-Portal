import 'package:flutter/material.dart';
import 'package:merchant_app/constants/colors/app_colors.dart';
import 'package:merchant_app/locator.dart';
import 'package:merchant_app/routing/route_names.dart';
import 'package:merchant_app/services/navigation_service.dart';
import 'package:merchant_app/views/editpersonalinfo/edit_personal_info_view.dart';
import 'package:merchant_app/widgets/home_page_footer/home_page_footer.dart';
import 'package:merchant_app/widgets/navigation_bar/navigation_bar.dart';

import 'package:merchant_app/constants/constants/globals.dart' as globals;

/// this is the page for user to check and change the personal and contact information
class PersonalInfoView extends StatefulWidget {
  const PersonalInfoView({Key? key}) : super(key: key);

  @override
  _PersonalInfoViewState createState() => _PersonalInfoViewState();
}

class _PersonalInfoViewState extends State<PersonalInfoView> {
  @override
  Widget build(BuildContext context) {
    if (globals.isLoggedIn) {
      return ListView(
        children: [
          /// Top Navigation Bar
          Container(
            /// Top Navigation Bar
            margin: const EdgeInsets.fromLTRB(16, 16, 64, 16),
            child: const MyNavigationBar(),
          ),

          /// Main content of the page
          Container(
            alignment: Alignment.center,
            child: SafeArea(
              child: Container(
                constraints:
                    const BoxConstraints(minWidth: 900, maxWidth: 1300),
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    /// top logo section!
                    const CircleAvatar(
                      radius: 50.0,
                      backgroundImage: AssetImage('./assets/logo.png'),
                    ),

                    /// Customer first name and last name section!
                    Text(
                      globals.name,
                      key: const Key("personalinfo_customer_name"),
                      style: TextStyle(
                          fontSize: 40.0,
                          fontWeight: FontWeight.bold,
                          color: infoPageTextColor),
                    ),

                    /// Customer type section!

                    Text(
                      accType(),
                      key: const Key("personalinfo_customer_type"),
                      style: TextStyle(
                          fontSize: 20.0,
                          color: infoPageTextColor,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2.5),
                    ),

                    /// Devider!
                    const SizedBox(
                      width: 1350.0,
                      height: 20.0,
                      child: Divider(
                        color: Color.fromARGB(255, 90, 38, 31),
                      ),
                    ),

                    /// Smaller wrapper to keep everything in center and look nice and professional
                    Container(
                      constraints:
                          const BoxConstraints(minWidth: 500, maxWidth: 800),
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          /// Phone number text section
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Container(
                              padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
                              child: Text(
                                'Phone Number:',
                                style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                    color: infoPageTextColor),
                              ),
                            ),
                          ),

                          /// Phone number card section
                          Card(
                            margin: const EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 25.0),
                            child: ListTile(
                              leading: Icon(
                                Icons.phone,
                                color: infoPageTextColor,
                              ),
                              title: Text(
                                globals.phoneNumber,
                                key: const Key("personalinfo_customer_phone"),
                                // textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 20.0, color: infoPageTextColor),
                              ),
                            ),
                          ),

                          /// Email Address text section
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Container(
                              padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
                              child: const Text(
                                'Email Address:',
                                style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 70, 70, 70)),
                              ),
                            ),
                          ),

                          /// Email Address card section
                          Card(
                            margin: const EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 25.0),
                            child: ListTile(
                              leading: Icon(
                                Icons.mark_email_unread_rounded,
                                color: infoPageTextColor,
                              ),
                              title: Text(
                                globals.email,
                                key: const Key("personalinfo_customer_email"),
                                style: TextStyle(
                                    fontSize: 20.0, color: infoPageTextColor),
                              ),
                            ),
                          ),

                          /// Home Address text section
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Container(
                              padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
                              child: Text(
                                'Home Address:',
                                style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                    color: infoPageTextColor),
                              ),
                            ),
                          ),

                          /// Home Address card section
                          Card(
                            margin: const EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 25.0),
                            child: ListTile(
                              leading: Icon(
                                Icons.fmd_good_rounded,
                                color: infoPageTextColor,
                              ),
                              title: Text(
                                globals.address,
                                key: const Key("personalinfo_customer_address"),
                                style: TextStyle(
                                    fontSize: 20.0, color: infoPageTextColor),
                              ),
                            ),
                          ),

                          /// Zip code text section
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Container(
                              padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
                              child: Text(
                                'Zip Code:',
                                style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                    color: infoPageTextColor),
                              ),
                            ),
                          ),

                          /// Zip code Address text section
                          Card(
                            margin: const EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 25.0),
                            child: ListTile(
                              leading: Icon(
                                Icons.my_location_rounded,
                                color: infoPageTextColor,
                              ),
                              title: Text(
                                globals.zipcode,
                                key: const Key("personalinfo_customer_zip"),
                                style: TextStyle(
                                    fontSize: 20.0, color: infoPageTextColor),
                              ),
                            ),
                          ),
                          const Text(
                            ' ',
                            style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 70, 70, 70)),
                          ),

                          /// Button to editing page
                          Container(
                            padding: const EdgeInsets.fromLTRB(25, 2, 25, 2),
                            child: MaterialButton(
                              key: const Key("editinfo_redirect_button"),
                              onPressed: () {
                                goToEditPersonalInfoPage();
                              },
                              child: const Text(
                                "Edit Information",
                                style: TextStyle(fontSize: 18),
                              ),
                              minWidth: double.infinity,
                              height: 52,
                              elevation: 24,
                              color: Colors.blue,
                              textColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(32)),
                            ),
                          ),
                          const Text(
                            ' ',
                            style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 70, 70, 70)),
                          ),
                          Container(
                            padding: const EdgeInsets.fromLTRB(25, 2, 25, 2),
                            child: MaterialButton(
                              key: const Key("orderhistory_redirect_button"),
                              onPressed: () {
                                goToOrderHistoryPage();
                              },
                              child: const Text(
                                "View Order history",
                                style: TextStyle(fontSize: 18),
                              ),
                              minWidth: double.infinity,
                              height: 52,
                              elevation: 24,
                              color: Colors.blue,
                              textColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(32)),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),

          /// Footer
          const HomePageFooter()
        ],
      );
    } else {
      return ListView(
        children: [
          /// Top Navigation Bar
          Container(
            margin: const EdgeInsets.fromLTRB(16, 16, 64, 16),
            child: const MyNavigationBar(),
          ),

          Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.fromLTRB(70, 20, 10, 110),
            child: const Text(
              "Please login to view your profile",
              textAlign: TextAlign.right,
              key: Key("notLoggedInText_myinfo"),
              style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
          ),
          const HomePageFooter()
        ],
      );
    }
  }

  String accType() {
    if (globals.isBuyer) {
      return "Buyer";
    } else {
      return "Merchant";
    }
  }

  void goToEditPersonalInfoPage() {
    locator<NavigationService>().navigateTo(EditPersonalInfoRoute, null);
  }

  void goToOrderHistoryPage() {
    locator<NavigationService>().navigateTo(OrderHistoryRoute, null);
  }
}
