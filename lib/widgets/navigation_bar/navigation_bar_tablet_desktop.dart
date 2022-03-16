import 'package:flutter/material.dart';
import 'package:merchant_app/routing/route_names.dart';

import 'navbar_item.dart';
import 'navbar_logo.dart';

import 'package:merchant_app/constants/constants/globals.dart' as globals;

class NavigationBarTabletDesktop extends StatelessWidget {
  const NavigationBarTabletDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String loginorlogouttext = loginorlogout();
    return Container(
      constraints: const BoxConstraints(
          minWidth: 100, maxWidth: 300, minHeight: 100, maxHeight: 300),
      height: 100,
      child: ListView(
        padding: const EdgeInsets.all(8),
        scrollDirection: Axis.horizontal,
        children: [
          const NavBarLogo(),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const NavBarItem('Home', HomeRoute),
              const SizedBox(
                width: 50,
              ),
              const NavBarItem('Category', CategoryRoute),
              const SizedBox(
                width: 50,
              ),
              const NavBarItem('Shopping Cart', ShoppingCartRoute),
              const SizedBox(
                width: 50,
              ),
              const NavBarItem('My Info', PersonalInfoRoute),
              const SizedBox(
                width: 50,
              ),
              NavBarItem(loginorlogouttext, LoginRoute),
              const SizedBox(
                width: 50,
              ),
              const NavBarItem('Sign Up', SignUpRoute),
              const SizedBox(
                width: 50,
              ),
              const NavBarItem('Merchant Portal', MerchantPortalRoute)
            ],
          )
        ],
      ),
    );
  }

  String loginorlogout() {
    if (globals.isLoggedIn) {
      return "Logout";
    } else {
      return "Login";
    }
  }
}
