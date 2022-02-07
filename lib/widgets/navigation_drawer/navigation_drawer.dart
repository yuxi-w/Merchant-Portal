import 'package:flutter/material.dart';
import 'package:merchant_app/widgets/navigation_drawer/drawer_item.dart';
import 'package:merchant_app/widgets/navigation_drawer/navigation_drawer_header.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: 800,
        width: 300,
        decoration: const BoxDecoration(
            color: Colors.white,
            boxShadow: <BoxShadow>[
              BoxShadow(color: Colors.black12, blurRadius: 16)
            ]),
        child: Column(
          children: const [
            NavigationDrawerHeader(),
            DrawerItem("Home", Icons.home),
            DrawerItem("Category", Icons.category),
            DrawerItem("Shopping Cart", Icons.shopping_cart_sharp),
            DrawerItem("My Info", Icons.person)
          ],
        ),
      ),
    );
  }
}
