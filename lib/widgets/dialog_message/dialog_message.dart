import 'package:flutter/material.dart';
import 'package:merchant_app/datamodel/shoppingitem/ShoppingItem.dart';
import 'package:merchant_app/routing/route_names.dart';
import 'package:merchant_app/services/navigation_service.dart';
import '../../locator.dart';

class DialogMessage {
  final ShoppingItem shoppingItem;
  final BuildContext buildContext;

  DialogMessage(this.buildContext, this.shoppingItem);

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
            ///Item added to your cart text
            const Padding(
              padding: EdgeInsets.all(15.0),
              child: Text(
                'Item added to your cart',
                style: TextStyle(fontSize: 20, color: Colors.red),
              ),
            ),

            ///Question text
            const Padding(
              padding: EdgeInsets.all(15.0),
              child: Text(
                'Do you want to stay on this page or go to your cart?',
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
            ),

            ///Buttons
            const Padding(padding: EdgeInsets.only(top: 50.0)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MaterialButton(
                  onPressed: () {
                    Navigator.pop(buildContext);
                  },
                  child: const Text("Stay"),
                  minWidth: 152,
                  height: 52,
                  elevation: 24,
                  color: Colors.amber.shade700,
                  textColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32)),
                ),
                const SizedBox(width: 30),
                MaterialButton(
                  onPressed: () {
                    locator<NavigationService>()
                        .navigateTo(ShoppingCartRoute, null);
                    Navigator.pop(buildContext);
                  },
                  child: const Text("Your cart"),
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
}
