import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:http/http.dart';
import 'package:merchant_app/constants/constants/AppConst.dart';
import 'package:merchant_app/datamodel/shoppingitem/ShoppingItem.dart';
import 'package:merchant_app/routing/route_names.dart';
import 'package:merchant_app/services/navigation_service.dart';
import 'package:merchant_app/widgets/dialog_message/dialog_message.dart';

import '../../locator.dart';

/// Shopping cart item
class ShopCartListItem extends StatefulWidget {
  final ShoppingItem userShoppingItem;

  const ShopCartListItem(this.userShoppingItem);

  @override
  _ShopCartListItemState createState() => _ShopCartListItemState();
}

class _ShopCartListItemState extends State<ShopCartListItem> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      height: 300,
      child: GFCard(
        elevation: 2,
        boxFit: BoxFit.fill,
        titlePosition: GFPosition.start,

        ///Product image
        // image: Image.asset(
        //   widget.imageSrc,
        //   height: 180,
        //   width: 150,
        //   fit: BoxFit.cover,
        // ),
        // showImage: true,

        ///Title and price
        title: GFListTile(
          titleText: widget.userShoppingItem.name,
          subTitleText: "\$${widget.userShoppingItem.price}",
          key: const Key("shoppingItemTitle"),
        ),
        content: Column(
          children: <Widget>[
            /// Item Description
            Text(
              widget.userShoppingItem.shortDescription!,
              key: const Key("shoppingItemDescription"),
            ),

            /// Item Quantity
            // Text(
            //   "\nAmount: " + widget.amount.toString(),
            //   key: const Key("shoppingItemAmount"),
            // ),
          ],
        ),

        ///Function buttons
        buttonBar: GFButtonBar(
          direction: Axis.vertical,
          children: <Widget>[
            /// Add Quantity Button
            // IconButton(
            //   onPressed: () {},
            //   icon: const Icon(Icons.add_circle_outline),
            //   key: const Key("shoppingItemAddButton"),
            // ),

            /// Remove Quantity Button
            // IconButton(
            //   onPressed: () {},
            //   icon: const Icon(Icons.remove_circle_outline),
            //   key: const Key("shoppingItemRemoveButton"),
            // ),

            /// Cancel Item
            TextButton(
                onPressed: () {
                  goToProductDetailPage();
                },
                child: const Text(
                  "More Info >",
                  key: Key("ShoppingCartMoreInfoButton"),
                )),
            IconButton(
              color: Colors.red,
              onPressed: () {
                removeFromCart(1, widget.userShoppingItem.id!);

                ///Show Dialog
                showDialog(
                    context: context,
                    builder: (BuildContext context) => DialogMessage(
                            context,
                            widget.userShoppingItem.name!,
                            "Item removed from your cart")
                        .createDialog());
                locator<NavigationService>()
                    .navigateTo(ShoppingCartRoute, null);
              },
              icon: const Icon(Icons.cancel_sharp),
              key: const Key("shoppingItemCancelButton"),
            ),
          ],
        ),
      ),
    );
  }

  /// Remove Item From Cart API
  void removeFromCart(int userId, int itemId) async {
    final response = await post(
        Uri.parse('${baseUrl}shopuser/remove$userId?itemId=$itemId'));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return print("Remove Item was successfull");
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to remove item');
    }
  }

  void goToProductDetailPage() {
    locator<NavigationService>()
        .navigateTo(ProductDetailRoute, widget.userShoppingItem);
  }
}
