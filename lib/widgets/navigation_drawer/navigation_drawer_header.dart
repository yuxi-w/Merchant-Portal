import 'package:flutter/material.dart';
import 'package:merchant_app/constants/colors/app_colors.dart';

/// This widget is for NavigationDrawer. When you shrink the screen
/// horizontally, This navigation drawer will appear on the left top
/// of the screen. Just like a mobile phone
class NavigationDrawerHeader extends StatelessWidget {
  const NavigationDrawerHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      color: primaryColor,
      alignment: Alignment.center,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: const [
          Text(
            "Merchant App",
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.w800, color: Colors.white),
          ),
          Text(
            "MENU",
            style: TextStyle(color: Colors.white),
          )
        ],
      ),
    );
  }
}
