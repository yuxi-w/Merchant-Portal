import 'package:flutter/material.dart';
import 'package:merchant_app/locator.dart';
import 'package:merchant_app/services/navigation_service.dart';

/// Top Navigation Bar Items
class NavBarItem extends StatelessWidget {
  final String title;
  final String navigationPath;

  const NavBarItem(this.title, this.navigationPath, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        locator<NavigationService>().navigateTo(navigationPath,null);
      },
      child: Text(
        title,
        style: const TextStyle(
          color: Color(0xFF162A49),
          fontSize: 20,
        ),
      ),
      key: const Key("navBarItem"),
    );
  }
}
