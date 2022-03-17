import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:merchant_app/constants/constants/AppConst.dart';
import 'package:merchant_app/routing/route_names.dart';
import 'package:merchant_app/services/navigation_service.dart';

import '../../locator.dart';

class QuestionDialog {
  final String itemName;
  final int itemId;
  final BuildContext buildContext;

  QuestionDialog(this.itemName, this.buildContext, this.itemId);

  Dialog createDialog() {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),

      /// Dialog size
      child: SizedBox(
        height: 300.0,
        width: 500.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ///Title Text
            Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.all(16),
              child: const Text(
                "This item will be removed",
                style: TextStyle(fontSize: 18, color: Colors.deepOrange),
              ),
            ),

            ///Body Text
            Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.fromLTRB(20, 0, 16, 16),
              child: Text(
                itemName,
                style: const TextStyle(fontSize: 16, color: Colors.black),
              ),
            ),

            const SizedBox(height: 50),

            ///Body Text
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.fromLTRB(20, 0, 16, 16),
              child: const Text(
                "Are you sure?",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.black),
              ),
            ),

            ///Button
            const Padding(padding: EdgeInsets.only(top: 50.0)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                /// No Button
                MaterialButton(
                  onPressed: () {
                    Navigator.pop(buildContext);
                  },
                  child: const Text("No"),
                  minWidth: 152,
                  height: 52,
                  elevation: 24,
                  color: Colors.red,
                  textColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32)),
                ),
                const SizedBox(width: 20),

                /// Yes Button
                MaterialButton(
                  onPressed: () {
                    /// Removing Item
                    removeItemAPICall();
                    Navigator.pop(buildContext);
                  },
                  child: const Text("Yes"),
                  minWidth: 152,
                  height: 52,
                  elevation: 24,
                  color: Colors.green,
                  textColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void removeItemAPICall() async {
    try {
      final response = await delete(Uri.parse('${baseUrl}shopitem/$itemId'));
      if (response.statusCode == 200) {
        print("Removed Successful");
        locator<NavigationService>().navigateTo(RemoveItemRoute, null);
      } else {
        print("Removed failed");
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
