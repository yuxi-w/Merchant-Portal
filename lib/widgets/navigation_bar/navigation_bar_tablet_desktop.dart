import 'package:flutter/material.dart';
import 'package:merchant_app/routing/route_names.dart';

import 'navbar_item.dart';
import 'navbar_logo.dart';

class NavigationBarTabletDesktop extends StatelessWidget {
  const NavigationBarTabletDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const NavBarLogo(),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: const [
              NavBarItem('Home', HomeRoute),
              SizedBox(
                width: 60,
              ),
              NavBarItem('Category', CategoryRoute),
              SizedBox(
                width: 60,
              ),
              NavBarItem('Shopping Cart', ShoppingCartRoute),
              SizedBox(
                width: 60,
              ),
              NavBarItem('My Info', PersonalInfoRoute),
              SizedBox(
                width: 60,
              ),
              NavBarItem('Login', LoginRoute)
            ],
          )
        ],
      ),
    );
  }
}
