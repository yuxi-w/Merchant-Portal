import 'package:flutter/material.dart';
import 'package:merchant_app/widgets/navigation_bar/navbar_item.dart';

class DrawerItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final String navigationPath;

  const DrawerItem(this.title, this.icon, this.navigationPath, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        child: Row(
          children: [
            Icon(icon),
            const SizedBox(
              width: 30,
            ),
            NavBarItem(title,navigationPath)
          ],
        ),
        padding: const EdgeInsets.only(left: 30, top: 60));
  }
}
