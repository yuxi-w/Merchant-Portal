import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:merchant_app/constants/constants/AppConst.dart';
import 'package:merchant_app/locator.dart';
import 'package:merchant_app/services/navigation_service.dart';

import 'package:merchant_app/constants/constants/globals.dart' as globals;

/// Top Navigation Bar Items
class NavBarItem extends StatelessWidget {
  final String title;
  final String navigationPath;

  const NavBarItem(this.title, this.navigationPath, {Key? key})
      : super(key: key);

  Future<void> logout(String id) async {
    try {
      Response response = await post(
        Uri.parse('${baseUrl}shopuser/logout$id'),
      );

      if (response.statusCode == 200) {
        print("logged out");
        globals.isLoggedIn = false;
      } else {
        print("logout fail");
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () async {
        if (globals.isLoggedIn && title == "Logout") {
          await logout(globals.id);
          CoolAlert.show(
            context: context,
            type: CoolAlertType.success,
            text: "Logout Successful!",
          );
        }
        locator<NavigationService>().navigateTo(navigationPath, null);
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
