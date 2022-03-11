import 'package:flutter/material.dart';
import 'package:merchant_app/datamodel/shoppingitem/ShoppingItem.dart';
import 'package:merchant_app/routing/route_names.dart';
import 'package:merchant_app/services/navigation_service.dart';
import '../../locator.dart';

class DialogMessage {
  final BuildContext buildContext;
  final String title;
  final String textBody;

  DialogMessage(this.buildContext, this.title, this.textBody);

  Dialog createDialog() {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),

      /// Dialog size
      child: SizedBox(
        height: 400.0,
        width: 400.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ///Title Text
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                title,
                style: const TextStyle(fontSize: 20, color: Colors.red),
              ),
            ),

            ///Body Text
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                textBody,
                style: const TextStyle(fontSize: 16, color: Colors.black),
              ),
            ),

            ///Button
            const Padding(padding: EdgeInsets.only(top: 50.0)),
            MaterialButton(
              onPressed: () {
                Navigator.pop(buildContext);
              },
              child: const Text("Okay"),
              minWidth: 152,
              height: 52,
              elevation: 24,
              color: Colors.amber.shade700,
              textColor: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32)),
            ),
          ],
        ),
      ),
    );
  }
}
