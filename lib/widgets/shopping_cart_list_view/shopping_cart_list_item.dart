import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:http/http.dart';
import 'package:merchant_app/constants/constants/AppConst.dart';
import 'package:merchant_app/datamodel/shoppingitem/ShoppingItem.dart';
import 'package:merchant_app/routing/route_names.dart';
import 'package:merchant_app/services/navigation_service.dart';
import 'package:merchant_app/widgets/dialog_message/dialog_message.dart';
import 'package:merchant_app/constants/constants/globals.dart' as globals;
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
    return Wrap(
      children: [
        GFCard(
          elevation: 2,
          boxFit: BoxFit.fill,
          titlePosition: GFPosition.start,

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
                widget.userShoppingItem.description!.substring(0, 70) + "...",
                key: const Key("shoppingItemDescription"),
              ),
            ],
          ),

          ///Function buttons
          buttonBar: GFButtonBar(
            direction: Axis.horizontal,
            children: <Widget>[
              /// Remove Button
              Container(
                margin: const EdgeInsets.fromLTRB(0, 40, 0, 20),
                child: MaterialButton(
                  onPressed: () {
                    removeFromCart(globals.id, widget.userShoppingItem.id!);

                    ///Show Dialog
                    showDialog(
                        context: context,
                        builder: (BuildContext context) => DialogMessage(
                                context,
                                widget.userShoppingItem.name!,
                                "Item removed from your cart")
                            .createDialog());

                    /// Call Shopping cart again
                    locator<NavigationService>()
                        .navigateTo(ShoppingCartRoute, null);
                  },
                  child: const Text("Remove Item"),
                  minWidth: 152,
                  height: 52,
                  elevation: 24,
                  color: Colors.red,
                  textColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32)),
                  key: const Key("shoppingItemCancelButton"),
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(0, 40, 0, 20),
                child: MaterialButton(
                  onPressed: () {
                    locator<NavigationService>().navigateTo(
                        ProductDetailRoute, widget.userShoppingItem);
                  },
                  child: const Text("Product Info"),
                  minWidth: 152,
                  height: 52,
                  elevation: 24,
                  color: Colors.blue,
                  textColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32)),
                  key: const Key("shoppingItemCancelButton"),
                ),
              ),
            ],
          ),
        ),
      ],
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
