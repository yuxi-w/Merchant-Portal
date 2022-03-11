import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:merchant_app/datamodel/shoppingitem/ShoppingItem.dart';

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
          subTitleText: widget.userShoppingItem.price,
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
            IconButton(
              color: Colors.red,
              onPressed: () {},
              icon: const Icon(Icons.cancel_sharp),
              key: const Key("shoppingItemCancelButton"),
            ),
          ],
        ),
      ),
    );
  }
}
