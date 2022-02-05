import 'package:flutter/material.dart';
import 'package:merchant_app/widgets/navigation_bar/navbar_item.dart';

class DrawerItem extends StatelessWidget {
  final String title;
  final IconData icon;

  const DrawerItem(this.title, this.icon, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        child: Row(
          children: [
            Icon(icon),
            const SizedBox(
              width: 30,
            ),
            NavBarItem(title)
          ],
        ),
        padding: const EdgeInsets.only(left: 30, top: 60));
  }
}
