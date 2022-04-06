import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:merchant_app/constants/constants/AppConst.dart';
import 'package:merchant_app/datamodel/shoppingitem/ShoppingItem.dart';
import 'package:merchant_app/datamodel/userInfo/UserInfo.dart';
import 'package:merchant_app/routing/route_names.dart';
import 'package:merchant_app/services/navigation_service.dart';

import '../../locator.dart';

class DialogPaymentOption {
  final BuildContext buildContext;
  final UserInfo userInfo;
  final List<ShoppingItem> userShoppingBag;

  DialogPaymentOption(this.buildContext, this.userInfo, this.userShoppingBag);

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
                "Address:",
                style: TextStyle(fontSize: 18, color: Colors.deepOrange),
              ),
            ),

            ///Body Text
            Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.fromLTRB(20, 0, 16, 16),
              child: Text(
                userInfo.address!,
                style: const TextStyle(fontSize: 16, color: Colors.black),
              ),
            ),

            ///Payment Title
            Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.all(16),
              child: const Text(
                "Payment Method:",
                style: TextStyle(fontSize: 18, color: Colors.deepOrange),
              ),
            ),

            ///Body Text
            Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.fromLTRB(20, 0, 16, 16),
              child: const Text(
                "Credit Card",
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
            ),

            ///Button
            const Padding(padding: EdgeInsets.only(top: 50.0)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                /// Cancel Button
                MaterialButton(
                  onPressed: () {
                    Navigator.pop(buildContext);
                  },
                  child: const Text("Cancel"),
                  minWidth: 152,
                  height: 52,
                  elevation: 24,
                  color: Colors.amber.shade700,
                  textColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32)),
                ),
                const SizedBox(width: 20),

                /// Place Order Button
                MaterialButton(
                  onPressed: () {
                    checkOutApiCall(userInfo.id!);
                    Navigator.pop(buildContext);
                    locator<NavigationService>()
                        .navigateTo(InvoiceRoute, userShoppingBag);
                  },
                  child: const Text("Place Order"),
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
          ],
        ),
      ),
    );
  }

  /// Checkout API Call
  void checkOutApiCall(String userId) async {
    final response =
        await post(Uri.parse('${baseUrl}shopuser/checkout$userId'));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return print("Checkout was successful");
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to Checkout');
    }
  }
}
