import 'package:flutter/material.dart';
import 'package:merchant_app/routing/route_names.dart';

import 'navbar_item.dart';
import 'navbar_logo.dart';

class NavigationBarTabletDesktop extends StatelessWidget {
  const NavigationBarTabletDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            children: const [
              NavBarItem('Home', HomeRoute),
              SizedBox(
                width: 50,
              ),
              NavBarItem('Category', CategoryRoute),
              SizedBox(
                width: 50,
              ),
              NavBarItem('Shopping Cart', ShoppingCartRoute),
              SizedBox(
                width: 50,
              ),
              NavBarItem('My Info', PersonalInfoRoute),
              SizedBox(
                width: 50,
              ),
              NavBarItem('Login', LoginRoute),
              SizedBox(
                width: 50,
              ),
              NavBarItem('Sign Up', SignUpRoute),
              SizedBox(
                width: 50,
              ),
              NavBarItem('Merchant Portal', MerchantPortalRoute)
            ],
          )
        ],
      ),
    );
  }
}
