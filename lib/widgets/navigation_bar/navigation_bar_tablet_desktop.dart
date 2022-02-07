import 'package:flutter/material.dart';

import 'navbar_item.dart';
import 'navbar_logo.dart';

class NavigationBarTabletDesktop extends StatelessWidget {
  const NavigationBarTabletDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const NavBarLogo(),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: const [
              NavBarItem('Home'),
              SizedBox(
                width: 60,
              ),
              NavBarItem('Category'),
              SizedBox(
                width: 60,
              ),
              NavBarItem('Shopping Cart'),
              SizedBox(
                width: 60,
              ),
              NavBarItem('My Info'),
              SizedBox(
                width: 60,
              ),
              NavBarItem('Login')
            ],
          )
        ],
      ),
    );
  }
}
