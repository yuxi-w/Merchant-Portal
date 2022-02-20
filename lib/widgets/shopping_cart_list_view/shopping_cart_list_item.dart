import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

/// Shopping cart item
class ShopCartListItem extends StatefulWidget {
  final String title;
  final String price;
  final String description;
  final int amount;
  final String imageSrc;

  const ShopCartListItem(
      this.title, this.price, this.description, this.amount, this.imageSrc,
      {Key? key})
      : super(key: key);

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

          ///Product image
          image: Image.asset(
            widget.imageSrc,
            height: 180,
            width: 150,
            fit: BoxFit.cover,
          ),
          showImage: true,

          ///Title and price
          title: GFListTile(
            titleText: widget.title,
            subTitleText: widget.price,
            key: const Key("shoppingItemTitle"),
          ),
          content: Column(
            children: <Widget>[
              Text(
                widget.description,
                key: const Key("shoppingItemDescription"),
              ),
              Text(
                "\nAmount: " + widget.amount.toString(),
                key: const Key("shoppingItemAmount"),
              ),
            ],
          ),

          ///Function buttons
          buttonBar: GFButtonBar(
            children: <Widget>[
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.add_circle_outline),
                key: const Key("shoppingItemAddButton"),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.remove_circle_outline),
                key: const Key("shoppingItemRemoveButton"),
              ),
              IconButton(
                color: Colors.red,
                onPressed: () {},
                icon: const Icon(Icons.cancel_sharp),
                key: const Key("shoppingItemCancelButton"),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
