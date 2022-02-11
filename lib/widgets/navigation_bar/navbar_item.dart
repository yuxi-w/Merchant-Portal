import 'package:flutter/material.dart';
import 'package:merchant_app/locator.dart';
import 'package:merchant_app/routing/route_names.dart';
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
        locator<NavigationService>().navigateTo(navigationPath);
      },
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 20,
        ),
      ),
    );
  }
}
